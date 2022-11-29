/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function render(id, pageindex, totalpage, gap, url)
{
    var container = document.getElementById(id);
    var content = "";
    if (pageindex > gap + 1)
        content += "<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "page=" + 1 + "\">First</a></li>";

    for (var i = pageindex - gap; i < pageindex; i++)
        if (i > 0)
            content += "<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "page=" + i + "\">" + +i + "</a></li>";

    content += " <li class=\"page-item active\"><a class=\"page-link\" href=\"" + url + "page=" + i + "\">" + pageindex + " <span class=\"sr-only\"></span></a></li>";

    for (var i = pageindex + 1; i <= pageindex + gap; i++)
        if (i <= totalpage)
            content += "<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "page=" + i + "\">" + i + "</a></li>";

    if (pageindex < totalpage - gap)
        content += "<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "page=" + totalpage + "\">Last</a></li>";
    container.innerHTML = content;
}

