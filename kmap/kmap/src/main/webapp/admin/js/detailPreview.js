/**
 * Created by lichao on 16/3/13.
 */
var Renderer_out;
(function($) {
   var Renderer = function(elt) {
        var dom = $(elt)
        var canvas = dom.get(0)
        //canvas = $(canvas).get(0);
        var ctx = canvas.getContext("2d");
        var gfx = arbor.Graphics(canvas);
        var particleSystem = null;
        var that = {
            init: function(system) {
                particleSystem = system;
                particleSystem.screen({padding: [100, 60, 60, 60], step: 0.02});

                $(window).resize(that.resize);
                that.resize();
                that.initMouseHandling();
            },

            redraw: function() {
                if (particleSystem === null) return;

                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctx.strokeStyle = "#D3D3D3";
                ctx.lineWidth = 1;
                ctx.beginPath();
                particleSystem.eachEdge(function(edge, pt1, pt2) {
                    /**
                     * edge: {source: Node, target: Node, length: #, data: {}}
                     * pt1: {x: #, y: #} source position in screen coords.
                     * pt2: {x: #, y: #} target position in screen coords.
                     */
                    var weight = null; // Math.max(1, edge.data.border / 100)
                    var color  = null; // edge.data.color

                    if (!color || ("" + color).match(/^[ \t]*$/)) {
                        color = null;
                    }

                    if (color !== undefined || weight !== undefined) {
                        ctx.save();
                        ctx.beginPath();

                        if (!isNaN(weight)) {
                            ctx.lineWidth = weight;
                        }

                        ctx.fillStyle = null;

                        ctx.moveTo(pt1.x, pt1.y);
                        ctx.lineTo(pt2.x, pt2.y);
                        ctx.stroke();
                        ctx.restore();
                    } else { // Draw a line from pt1 to pt2.
                        ctx.moveTo(pt1.x, pt1.y);
                        ctx.lineTo(pt2.x, pt2.y);
                    }
                });

                ctx.stroke();

                particleSystem.eachNode(function(node, pt) {
                    /**
                     * node: {mass: #, p: {x, y}, name: "", data: {}}
                     * pt:   {x: #, y: #} node position in screen coords.
                     *
                     * Determine the box size and round off the coords.
                     * We'll be drawing a text label.
                     */
                    var w = ctx.measureText(node.data.label || "").width + 6;
                    var label = node.data.label;

                    if (!(label || "").match(/^[ \t]*$/)) {
                        pt.x = Math.floor(pt.x);
                        pt.y = Math.floor(pt.y);
                    } else {
                        label = null;
                    }
                    //顶级节点颜色不同
                    var courseName=selectcourse;
                    if(node.name==courseName) {
                        gfx.oval(pt.x - w / 2, pt.y - w / 2, w, w, {fill: "red", alpha: 0.9});
                    }else
                    {
                        gfx.oval(pt.x - w / 2, pt.y - w / 2, w, w, {fill: "#b2b19d", alpha: 0.9});
                    }
                    //尾部节点

                    var width = w / 10;
                    function print(width, name) {
                        if (name.length > width * 2) {
                            name = name.substring(0, width * 2);
                        }
                        if (name.length > width) {
                            gfx.text(name.substring(0, width), pt.x, pt.y, {color: "white", align: "center", font: "Arial", size: 11});
                            gfx.text(name.substring(width), pt.x, pt.y + 12, {color: "white", align: "center", font: "Arial", size: 11});
                        } else {
                            gfx.text(name, pt.x, pt.y + 6, {color: "white", align: "center", font: "Arial", size: 11});
                        }
                    }
                    print(width, node.name);

                });
            },

            resize: function() {
                var w = document.documentElement.clientWidth-100;
                var h = $(window).height();
                canvas.width = w; canvas.height = 600; // resize the canvas element to fill the screen
                particleSystem.screenSize(w,650); // inform the system so it can map coords for us
                that.redraw()
            },

            initMouseHandling: function() {
                selected = null;
                nearest  = null;

                var dragged = null;
                var oldmass = 1;

                $(canvas).mousedown(function(e) {
                    var pos = $(this).offset();
                    var p = {x: e.pageX - pos.left, y: e.pageY - pos.top};

                    selected = nearest = dragged = particleSystem.nearest(p);

                    if (selected.node !== null) {
                        dragged.node.tempMass = 50;
                        dragged.node.fixed = true;
                    }

                    return false;
                });

                $(canvas).mousemove(function(e) {
                    var old_nearest = nearest && nearest.node._id;
                    var pos = $(this).offset();
                    var s = {x: e.pageX - pos.left, y: e.pageY - pos.top};

                    nearest = particleSystem.nearest(s);

                    if (!nearest) {
                        return;
                    }

                    if (dragged !== null && dragged.node !== null) {
                        var p = particleSystem.fromScreen(s);
                        dragged.node.p = {x: p.x, y: p.y};
                    }
                });
                $(window).bind('mouseup', function(e) {
                    if (dragged === null || dragged.node === undefined) {
                        return;
                    }
                    dragged.node.fixed = false;
                    dragged.node.tempMass = 100;
                    dragged = null;
                    selected = null;
                    return false;
                });
            }
        };
        return that;
    };
    //
    Renderer_out=Renderer;

    var Maps = function(elt,coursename) {
        var sys = arbor.ParticleSystem(4000, 500, 0.5, 45);
        sys.renderer = Renderer("#viewport");
        var dom = $(elt);
        var _links = dom.find('ul');
        var _maps = {
            detail: {title: "Detail", p: {stiffness: 400}}
        };
        var that = {
            init: function() {
                //调用selectMap函数
                that.selectMap(coursename);
                // _links.find('li > a').click(that.mapClick);
                // _links.find('.detail').click();
                return that;
            },
            mapClick: function(e) {
                var selected = $(e.target);
                var newMap = selected.attr('class');
                if (newMap in _maps) {
                    that.selectMap(newMap);
                }
                _links.find('li > a').removeClass('active');
                selected.addClass('active');
                return false;
            },

            selectMap: function(map_id) {
                var url = "/kmap/detail.do?courseId="+map_id;
                $.getJSON(url, function(data) {
                    var nodes = data.nodes;
                    $.each(nodes, function(name, info) {
                        info.label = name;
                    });
                    sys.merge({nodes: nodes, edges: data.edges});
                    sys.parameters(_maps[map_id].p);
                });
            }
        };
        return that.init();
    }
    //$(document).ready(function() {
    //    var CLR = {
    //        branch:"#b2b19d",
    //        code:"orange",
    //        doc:"#922E00",
    //        demo:"#a7af00"
    //    }
    //    var courseId= $("#courseId").valueOf();
    //    var mcp = Maps("#maps",courseId);
    //});

})(this.jQuery);
