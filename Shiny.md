Shiny Overview
========================================================
author: Winston Saunders
date: December 2016
autosize: true

First Slide
========================================================

For more details on authoring R presentations please visit <https://support.rstudio.com/hc/en-us/articles/200486468>.

- Bullet 1
- Bullet 2
- Bullet 3

Slide With Code
========================================================

<!--html_preserve--><div class="row">
<div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label class="control-label" for="main">Main title</label>
<div>
<select id="main" class="form-control"><option value="A" selected>A</option>
<option value="B">B</option>
<option value="C">C</option>
<option value="D">D</option>
<option value="E">E</option>
<option value="F">F</option>
<option value="G">G</option>
<option value="H">H</option>
<option value="I">I</option>
<option value="J">J</option>
<option value="K">K</option>
<option value="L">L</option>
<option value="M">M</option>
<option value="N">N</option>
<option value="O">O</option>
<option value="P">P</option>
<option value="Q">Q</option>
<option value="R">R</option>
<option value="S">S</option>
<option value="T">T</option>
<option value="U">U</option>
<option value="V">V</option>
<option value="W">W</option>
<option value="X">X</option>
<option value="Y">Y</option>
<option value="Z">Z</option></select>
<script type="application/json" data-for="main">{}</script>
</div>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="size">Point size</label>
<input class="js-range-slider" id="size" data-min="0.2" data-max="5" data-from="1" data-step="0.05" data-grid="true" data-grid-num="9.6" data-grid-snap="false" data-keyboard="true" data-keyboard-step="1.04166666666667" data-drag-interval="true" data-data-type="number" data-prettify-separator=","/>
</div>
</form>
</div>
<div class="col-sm-8">
<div id="out2e4ab29459701582" class="shiny-plot-output" style="width: 100% ; height: "></div>
</div>
</div><!--/html_preserve-->

Slide With Plot
========================================================

![plot of chunk unnamed-chunk-2](Shiny-figure/unnamed-chunk-2-1.png)
