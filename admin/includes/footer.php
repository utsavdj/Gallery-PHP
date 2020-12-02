  </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

  <script src="https://tinymce.cachefly.net/4.1/tinymce.min.js"></script>
  <script src="js/dropzone.min.js"></script>
  <script src="js/scripts.js"></script>

  <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

          var data = google.visualization.arrayToDataTable([
              ['Task', 'Hours per Day'],
              ['Views',     <?php echo $session->count; ?>],
              ['Photos',      <?php echo Photo::count_all(); ?>],
              ['Users',  <?php echo User::count_all(); ?>],
              ['Comments', <?php echo Comment::count_all(); ?>]
          ]);

          var options = {
              legend: 'none',
              pieSliceText: 'label',
              backgroundColor: 'transparent',
              slices: {
                  0: { color: '#337AB7' },
                  1: { color: '#5CB85C' },
                  2: { color: '#F0AD4E' },
                  3: { color: '#D9534F' }
              },
              title: 'My Daily Activities'
          };

          var chart = new google.visualization.PieChart(document.getElementById('piechart'));

          chart.draw(data, options);
      }
  </script>

</body>

</html>
