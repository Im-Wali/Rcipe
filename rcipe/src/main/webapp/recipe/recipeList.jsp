<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<link href="../css/style.min.css?06062013" rel="stylesheet">
<script src="../js/jquery.lazyload.js"></script>

<script>
  $(document).ready(function() {
    $('#gallery').least();
  });
</script>
<div class="row"
  style="margin-top: 2%; display: inline-block; text-align: center;">
  <div class="col-md-2 "></div>
  <div class="col-md-8 "
    style="display: inline-block; text-align: center;">
    <section>
      <ul id="gallery">

        <li id="fullPreview"></li>
        <li><a href="/rcipe/recipe/recipe.jsp"></a> <img src="../img/images.jpg"
          width="240" height="200" style="display: inline;">
          <div class="overLayer"></div>
          <div class="infoLayer">
            <ul>
              <li>
                <h2>Fish</h2>
              </li>
              <li>
                <p>View Picture</p>
              </li>
            </ul>
          </div>
          
      </ul>
    </section>
    <!-- cardSerction 끝 -->
  </div>
  <div class="col-md-2"></div>
</div>
