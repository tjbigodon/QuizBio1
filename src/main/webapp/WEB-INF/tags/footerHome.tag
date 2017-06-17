<%@attribute name="versao" required="true"%>
<%@attribute name="ano" required="true"%>
<%@attribute name="desenvolvedores" required="true"%>
<%@attribute name="caminho" required="true"%>

<!--BEGIN FOOTER-->
                <div id="footer">
                    <div class="copyright">
                        <a href="http://themifycloud.com">${ano} - SisCoor Web ${versao}- Desenvolvedores: ${desenvolvedores}</a></div>
                </div>
                <!--END FOOTER-->
            </div>
            <!--END PAGE WRAPPER-->
        </div>
    </div>
    <script src="${caminho}/script/jquery-1.10.2.min.js"></script>
    <script src="${caminho}/script/jquery-migrate-1.2.1.min.js"></script>
    <script src="${caminho}/script/jquery-ui.js"></script>
    <script src="${caminho}/script/bootstrap.min.js"></script>
    <script src="${caminho}/script/bootstrap-hover-dropdown.js"></script>
    <script src="${caminho}/script/html5shiv.js"></script>
    <script src="${caminho}/script/respond.min.js"></script>
    <script src="${caminho}/script/jquery.metisMenu.js"></script>
    <script src="${caminho}/script/jquery.slimscroll.js"></script>
    <script src="${caminho}/script/jquery.cookie.js"></script>
    <script src="${caminho}/script/icheck.min.js"></script>
    <script src="${caminho}/script/custom.min.js"></script>
    <script src="${caminho}/script/jquery.news-ticker.js"></script>
    <script src="${caminho}/script/jquery.menu.js"></script>
    <script src="${caminho}/script/pace.min.js"></script>
    <script src="${caminho}/script/holder.js"></script>
    <script src="${caminho}/script/responsive-tabs.js"></script>
    <script src="${caminho}/script/jquery.flot.js"></script>
    <script src="${caminho}/script/jquery.flot.categories.js"></script>
    <script src="${caminho}/script/jquery.flot.pie.js"></script>
    <script src="${caminho}/script/jquery.flot.tooltip.js"></script>
    <script src="${caminho}/script/jquery.flot.resize.js"></script>
    <script src="${caminho}/script/jquery.flot.fillbetween.js"></script>
    <script src="${caminho}/script/jquery.flot.stack.js"></script>
    <script src="${caminho}/script/jquery.flot.spline.js"></script>
    <script src="${caminho}/script/zabuto_calendar.min.js"></script>
    <script src="${caminho}/script/index.js"></script>
    <!--LOADING SCRIPTS FOR CHARTS-->
    <script src="${caminho}/script/highcharts.js"></script>
    <script src="${caminho}/script/data.js"></script>
    <script src="${caminho}/script/drilldown.js"></script>
    <script src="${caminho}/script/exporting.js"></script>
    <script src="${caminho}/script/highcharts-more.js"></script>
    <script src="${caminho}/script/charts-highchart-pie.js"></script>
    <script src="${caminho}/script/charts-highchart-more.js"></script>
    <!--CORE JAVASCRIPT-->
    <script src="${caminho}/script/main.js"></script>
    <script>        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-145464-12', 'auto');
        ga('send', 'pageview');


</script>
</body>
</html>