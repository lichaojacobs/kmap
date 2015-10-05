/**
 * This method is used for a better appearance of the course name.
 * This method assumes that two line is enough for displaying the name.
 * @author andy
 */
function printText(width, name) {
  if (name.length > width * 2) {
    name = name.substring(0, width * 2);
  }

  if (name.length > width) {
    gfx.text(name.substring(0, width), pt.x, pt.y, {color: "white", align: "center", font: "Arial", size: 11});
    gfx.text(name.substring(width), pt.x, pt.y + 12, {color: "white", align: "center", font: "Arial", size: 11});
  } else {
    gfx.text(name.substring(width), pt.x, pt.y - 6, {color: "white", align: "center", font: "Arial", size: 11});
  }
}


/**
 * This method figures out diameter by the credit.
 *
 * Note: 12 is a single Chinese character's width.
 *
 * RULE:
 * 0: 3 * 12 px
 * 1: 4 * 12 px
 * 2: 5 * 12 px
 * .: ...... px
 * 6: 9 * 12 px
 * max: 10 * 12 px
 *
 * @author andy
 */
function getDiameter(credit) {
  var c = Math.round(credit);
  return (c >= 0 && c <= 6 ? c + 3 : 10) * 12;
}
