(function() {

  Renderer = function(canvas) {
    canvas = $(canvas).get(0);

    var ctx = canvas.getContext("2d");
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

          ctx.clearRect(pt.x - w / 2, pt.y - 7, w, 14);

          // Draw the text.
          if (label) {
            ctx.font = "bold 11px Arial";
            ctx.textAlign = "center";

            ctx.fillStyle = "#888888";
            ctx.fillText(label || "", pt.x, pt.y + 4);
          }
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
      },
    };

    return that;
  };

  var Maps = function(elt) {
    var sys = arbor.ParticleSystem(4000, 500, 0.5, 45);
    sys.renderer = Renderer("#viewport");

    var dom = $(elt);
    var _links = dom.find('ul');

    var _maps = {
      detail: {title: "Detail", p: {stiffness: 400}}
    };

    var that = {
      init: function() {
        $.each(_maps, function(stub, map) {
          _links.append("<li><a href='#/" + stub + "' class='" + stub + "'>" + map.title + "</a></li>");
        });

        _links.find('li > a').click(that.mapClick);
        _links.find('.detail').click();

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
        var url = "/kmap/detail";
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

  $(document).ready(function() {
    var mcp = Maps("#maps");
  });

})();
