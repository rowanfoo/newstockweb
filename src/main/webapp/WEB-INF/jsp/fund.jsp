<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<c:set var='test'  value='rowan' scope="session"/>

    <h1>${test}</h1>

    <c:forEach items = "${wishlist}" var = "wish">
        <c:out value = "${wish.code} , "/>
    </c:forEach>



<head>


    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">


        <script src="${pageContext.request.contextPath}/highstock.js"></script>

        <script src="${pageContext.request.contextPath}/exporting.js"></script>
        <script src="${pageContext.request.contextPath}/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/ema.js"></script>
        <script src="${pageContext.request.contextPath}/rsi.js"></script>
        <script src="${pageContext.request.contextPath}/indicators.js"></script>


        <script type="text/javascript">
            $(function() {
                var seriesCounter = 0,
                    chart;
                var date = new Date();



                /**
                 * Create the chart when all data is loaded
                 * @returns {undefined}
                 */
                function createChart(name ,seriesOptions) {

                    // create the chart
                    // chart = new  Highcharts.StockChart('container', {
                    chart = new  Highcharts.StockChart(name, {

                        chart: {
                            width: 400,
                            height: 300
                        },


                        legend: {
                            enabled: false
                        },

                        xAxis: {
                            min: Date.UTC(date.getFullYear() - 1 , 1, 1, 16, 00), //previous day  at 16.00
                            max: new Date().getTime() //get actual time
                        },

                        rangeSelector: {
                            enabled: false
                        },

                        navigator: {
                            enabled: false
                        },

                        tooltip: {
                            split: true
                        },

                        series: [{
                            type: 'ohlc',
                            id: 'aapl',
                            data: seriesOptions,

                            dataGrouping: {
                                enabled: true,
                                units: [ ['month', [1]] ]

                            }

                        },




                        ]
                    });

                };
                $(document).ready(function() {
                    <c:forEach items = "${wishlist}" var = "wish" varStatus="theCount">


                        var year =date.getFullYear()-1;
                        var mm = (date.getMonth()+1).toString();
                        var dd  = date.getDate().toString();

                        var url =   "${path}/data?code=${wish.code}&date="+year+"-"+ (mm[1]?mm:"0"+mm[0])+"-"+ (dd[1]?dd:"0"+dd[0]);


                        console.log(url);

                        $.getJSON(url,  function(data) {



                            var seriesOptions = [];

                            for(var i = 0; i < data.length; i++){



                                seriesOptions.push([
                                    new Date(data[i].date).getTime(), // the date
                                    data[i].open_price , // open
                                    data[i].day_high_price, // high
                                    data[i].day_low_price, // low
                                    data[i].last_price // close
                                ]);
                            }


                            createChart('container${theCount.count}',seriesOptions) ;
                            chart.series.forEach(function(ser) {
                                ser.update({
                                    dataGrouping: {
                                        units: [ ['day', [1]] ],
                                        groupPixelWidth: 10
                                    }
                                }, false);


                            });

                            var title = "${wish.code} :   "  +  (data[data.length-1].changepercent * 100 )  + " %";
                         //   console.log(title);
                        //    chart.xAxis[0].setTitle({ text: "${wish.code} " }   );
                            chart.xAxis[0].setTitle( { text: title }     );

                            chart.redraw();



                        });

                    </c:forEach>



                });

            });


        </script>

        <style>
            input[type=text] {
                width: 3em

            }

            font-size: 5px;
            label {
                font-weight: bold;
            }

        </style>

    </head>
    <html>
<body>



<div class="container">
    <div class="row">

        <c:forEach items = "${wishlist}" var = "wish" varStatus="theCount">
            <div class="col-md-6" >
                <div id='container${theCount.count}'></div>
            </div>

        </c:forEach>
    </div>

</div>

<h4> v3</h4>

</body>
</html>


