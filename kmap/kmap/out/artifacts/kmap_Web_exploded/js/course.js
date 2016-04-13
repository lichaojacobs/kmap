(function() {

    var intersect_line_line = function(p1, p2, p3, p4)
    {
        var denom = ((p4.y - p3.y)*(p2.x - p1.x) - (p4.x - p3.x)*(p2.y - p1.y));
        if (denom === 0) return false // lines are parallel
        var ua = ((p4.x - p3.x)*(p1.y - p3.y) - (p4.y - p3.y)*(p1.x - p3.x)) / denom;
        var ub = ((p2.x - p1.x)*(p1.y - p3.y) - (p2.y - p1.y)*(p1.x - p3.x)) / denom;

        if (ua < 0 || ua > 1 || ub < 0 || ub > 1)  return false
        return arbor.Point(p1.x + ua * (p2.x - p1.x), p1.y + ua * (p2.y - p1.y));
    }

    var intersect_line_box = function(p1, p2, boxTuple)
    {
        var p3 = {x:boxTuple[0], y:boxTuple[1]},
            w = boxTuple[2],
            h = boxTuple[3]
        var tl = {x: p3.x, y: p3.y};
        var tr = {x: p3.x + w, y: p3.y};
        var bl = {x: p3.x, y: p3.y + h};
        var br = {x: p3.x + w, y: p3.y + h};

        return intersect_line_line(p1, p2, tl, tr) ||
            intersect_line_line(p1, p2, tr, br) ||
            intersect_line_line(p1, p2, br, bl) ||
            intersect_line_line(p1, p2, bl, tl) ||
            false
    }
    var Renderer = function(canvas) {
    canvas = $(canvas).get(0);
    var ctx = canvas.getContext("2d");
    var gfx = arbor.Graphics(canvas);
    var particleSystem = null;
    var _vignette = null
    var selected = null,
        nearest = null,
        _mouseP = null;
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
              //backup #D3D3D3
              gfx.line(pt1, pt2, {stroke: "#D3D3D3", width: 2, alpha: 0.8});
          });
          particleSystem.eachNode(function(node, pt) {
              var w = function(credit) {
                  var c = Math.round(credit);
                  //这里改成10
                  return (c >= 0 && c <= 6 ? c + 3 : 10) * 10;
              }(node.data.credit);
              // Print Course Mark.if Mark!=0 draw oval
              if (node.data.mark != 0) {
                  var percent = node.data.mark / 100.0 * 2.0;
                  ctx.save();
                  ctx.beginPath();
                  ctx.moveTo(pt.x, pt.y);
                  //使边缘稍微明显一点
                  ctx.arc(pt.x, pt.y, w * 0.55, 0, percent * Math.PI);
                  ctx.lineTo(pt.x, pt.y);
                  ctx.fillStyle = node.data.category.color;
                  ctx.globalAlpha = 0.5;
                  ctx.fill();
                  ctx.strokeStyle = node.data.category.color;
                  ctx.stroke();
                  ctx.restore();
              }
              //nodeBoxes
              //nodeBoxes[node.name] = [pt.x-w/2, pt.y-w/2, w,w];
              gfx.oval(pt.x - w / 2, pt.y - w / 2, w, w, {fill: node.data.category.color, alpha: 0.9});
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
      resize:function(){
        var w = $(window).width(),
            h = $(window).height();
        canvas.width = w; canvas.height = 650; // resize the canvas element to fill the screen
        particleSystem.screenSize(w,650); // inform the system so it can map coords for us
        _vignette = null
        that.redraw()
      },
      initMouseHandling: function() {
        selected = null;
        nearest  = null;
        var ppoint=null;
        var dragged = null;
        var oldmass = 1;
        //定义一系列处理函数
        var _section = null;

        var handler = {
          moved:function(e){
            var pos = $(canvas).offset();
            _mouseP = arbor.Point(e.pageX-pos.left, e.pageY-pos.top)
            nearest = particleSystem.nearest(_mouseP);
            if (!nearest.node) return false;
            return false
          },
          clicked:function(e){
            selected = (nearest.distance < 20) ? nearest : null
            if(selected===null){
              //点击空白区域使得浮动框消失
              $(".list-group").attr("style","display:none");
              return false;
            }
            var pos = $(canvas).offset();
            _mouseP = arbor.Point(e.pageX-pos.left, e.pageY-pos.top)
            ppoint=_mouseP;
            nearest = dragged = particleSystem.nearest(_mouseP);
            if (dragged && dragged.node !== null) dragged.node.fixed = true
            $(canvas).unbind('mousemove', handler.moved);
            $(canvas).bind('mousemove', handler.dragged)
            $(window).bind('mouseup', handler.dropped)
            return false
          },
          dragged:function(e){
            var old_nearest = nearest && nearest.node._id
            var pos = $(canvas).offset();
            var s = arbor.Point(e.pageX-pos.left, e.pageY-pos.top)

            if (!nearest) return
            if (dragged !== null && dragged.node !== null){
              var p = particleSystem.fromScreen(s)
              dragged.node.p = p
            }
            return false
          },
          dropped:function(e){
            if (dragged===null || dragged.node===undefined) {
              return false;
            }
            if (dragged.node !== null) dragged.node.fixed = false
            dragged.node.tempMass = 1000
            var popup;//
            var pos = $(canvas).offset();
            var s = arbor.Point(e.pageX-pos.left, e.pageY-pos.top);
            moveleft=ppoint.x-s.x;
            moveright=ppoint.y-s.y;
            if (Math.abs(moveleft)<5&&nearest.node.name!=_section && nearest.node===selected.node){
              // _section = nearest.node.name
              // that.switchSection(_section)
              //alert($(".float_combox").html());
              //  $(".float_combox").attr("style","position:absolute;top:"+e.pageY+"px;left:"+e.pageX+"px");
              //alert(selected.node.label)
              // var cell=document.getElementById("relstable").rows[0].cells;
              //cell[0].innerHTML="<input readonly='true' id='graphid' value='udh'/>"
              var modal=$("#modal a:first");
              modal.text(nearest.node.name+"详情图");
              modal.attr("href","/kmap/detail/index.do?courseId="+nearest.node.data.id+"&courseName="+nearest.node.data.name);
              $(".list-group").attr("style",";position:absolute;top:"+e.pageY+"px;left:"+e.pageX+"px");
            }

            $(canvas).unbind('mousemove', handler.dragged)
            $(window).unbind('mouseup', handler.dropped)
            $(canvas).bind('mousemove', handler.moved);
            dragged = null;
            _mouseP = null;
            selected = null
            return false
          }
        }
        $(canvas).mousedown(handler.clicked);
        $(canvas).mousemove(handler.moved);
      }
    };

    return that;
  };

  var Maps = function(elt) {
    //里面传了参数4000, 500, 0.5, 45 repulsion为斥力
    var sys = arbor.ParticleSystem({stiffness:900, repulsion:30000, gravity:true, dt:0.015,precision:0.8});
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
