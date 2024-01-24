let path = window.location.pathname;
let pageName = "date";
if (path.includes("time")) {
  pageName = "time";
}
alert(`This is the ${pageName} template `);
