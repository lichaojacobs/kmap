(function() {

  Renderer = function(canvas) {
    canvas = $(canvas).get(0);

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
        gfx.clear();

        particleSystem.eachEdge(function(edge, pt1, pt2) {
          gfx.line(pt1, pt2, {stroke: "#D3D3D3", width: 2, alpha: 0.8});
        });

        particleSystem.eachNode(function(node, pt) {

          var w = function(credit) {
            var c = Math.round(credit);
            return (c >= 0 && c <= 6 ? c + 3 : 10) * 12;
          }(node.data.credit);

          // Print Course Mark.
          if (node.data.mark != 0) {
            var percent = node.data.mark / 100.0 * 2.0;

            ctx.save();
            ctx.beginPath();
            ctx.moveTo(pt.x, pt.y);
            ctx.arc(pt.x, pt.y, w * 0.53, 0, percent * Math.PI);
            ctx.lineTo(pt.x, pt.y);
            ctx.fillStyle = node.data.category.color;
            ctx.globalAlpha = 0.5;
            ctx.fill();
            ctx.strokeStyle = node.data.category.color;
            ctx.stroke();
            ctx.restore();
          }

          gfx.oval(pt.x - w / 2, pt.y - w / 2, w, w, {fill: node.data.category.color, alpha: 0.9});

          var width = w / 12;

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
        var w = $(window).width();
        var h = $(window).height();

        canvas.width  = w;
        canvas.height = h;

        particleSystem.screenSize(w, h);
        that.redraw();
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

  var Maps = function(elt) {
    var sys = arbor.ParticleSystem(4000, 500, 0.5, 45);
    sys.renderer = Renderer("#viewport");

    var dom = $(elt);
    var _links = dom.find('ul');

    var _maps = {
      course: {title: "Course", p: {stiffness: 400}}
    };

    var that = {
      init: function() {
        $.each(_maps, function(stub, map) {
          _links.append("<li><a href='#/" + stub + "' class='" + stub + "'>" + map.title + "</a></li>");
        });

        _links.find('li > a').click(that.mapClick);
        _links.find('.course').click();

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
        var url = "/kmap/course.do";
        $.get(url,null, function(data,status) {

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

  $(document).ready(function() {
    var mcp = Maps("#maps");
  });

})();
