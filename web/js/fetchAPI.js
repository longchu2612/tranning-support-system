//var myForm = document.getElementById('myForm')
//
//
//
//myForm.addEventListener('submit', function (e) {
//    e.preventDefault()
//    var country = document.getElementById('country').value
//
//    var url = "https://api.covid19api.com/live/country/" + country + "/status/confirmed/date/2020-03-21T13:13:30Z'"
//
//
//
//    fetch(url)
//            .then((res) => res.json())
//            .then((res) => {
//                console.log(res)
//                var length = res.length
//                var index = length - 1
//
//                //lay gia tri tu link api
//                var country = document.getElementById('countries')
//                var confirmed = document.getElementById('confirmed')
//                var death = document.getElementById('death')
//                var recovered = document.getElementById('recovered')
//                var active = document.getElementById('active')
//                var date = document.getElementById('date')
//                //formatdate :
//                
//                // get gia tri lay tu api sang jsp 
//                country.append(res[index].Country)
//                confirmed.append(res[index].Confirmed)
//                death.append(res[index].Deaths)
//                recovered.append(res[index].Recovered)
//                active.append(res[index].Active)
//                date.append(res[index].Date)
//            })
//})

//var myForm = document.getElementById('myForm');
//
//
//myForm.addEventListener('submit', function (e) {
//    e.preventDefault();
//    var url = "";
//    var country = null;
//    country = document.getElementById('country').value;



//    if (country == null) {
//        url = "https://api.covid19api.com/live/country/vietnam/status/confirmed/date/2020-03-21T13:13:30Z'";
//    } else {
//
//
//        url = "https://api.covid19api.com/live/country/" + country + "/status/confirmed/date/2020-03-21T13:13:30Z'";
//
//    }
fetch("https://api.covid19api.com/live/country/vietnam/status/confirmed/date/2020-03-21T13:13:30Z'").then((data) => {
//    console.log(data)
    return data.json(); // converted to object

}).then((objectData) => {
//    console.log(objectData[0].Country)
    let tableData = "";
    objectData.map((values) => {
        tableData += ` <tr>
                <td>${values.Country}</td>
                <td>${values.Confirmed}</td>
                <td>${values.Deaths}</td>
                <td>${values.Recovered}</td>
                <td>${values.Active}</td>
                <td>${values.Date}</td>
            </tr>`;
    });
    document.getElementById("table_body").
            innerHTML = tableData;
})



