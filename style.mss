// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';

// Palette //
@dark: #0B486B;
@medium: #79BD9A;
@light: #fff8f0;

Map {
  background-color:@light;
}

// Political boundaries //

#admin {
  ::a[maritime=0][admin_level=2] {
    line-join: round;
    line-cap:round;
    line-color: @light;
    line-width: 1.4+6;
    [zoom>=6] { line-width: 2+6; }
    [zoom>=8] { line-width: 4+6; }
  }
  ::b[zoom>=0] {
    line-join: round;
    line-cap:round;
    line-color: @dark;
    [admin_level=2] {
      line-width: 1.4;
      [zoom>=6] { line-width: 2; }
      [zoom>=8] { line-width: 4; }
      [disputed=1] { line-dasharray: 1,4; }
    }
    [admin_level>2] {
      line-width: 0;
      [zoom>=5] { line-width: 1; line-dasharray:2,4; }
      [zoom>=7] { line-width: 2; line-dasharray:2,5; }
      [zoom>=9] { line-width: 3; line-dasharray:2,6; }
    }
  }
}

// Water Features //

#water {
  polygon-fill: @dark;
  polygon-gamma: 0.4;
}

// Landuse areas //

#landuse {
  [class='cemetery'],
  [class='park'] {
    polygon-pattern-file:url(img/halftone_40_medium.png);
    polygon-pattern-alignment:global;
  }
  [class='industrial'] {
    polygon-pattern-file:url(img/halftone_90_dark.png);
    polygon-pattern-alignment:global;
  }
  [class='school'] {
    polygon-pattern-file:url(img/halftone_90_medium.png);
    polygon-pattern-alignment:global;
  }
  [class='pitch'] {
    line-color:@light;
    line-width:1.2;
  }
}

// Aeroways //

#aeroway['mapnik::geometry_type'=2] {
  [type='runway'] {
    [zoom>=12] { line-pattern-file:url(img/road_4.png); }
    [zoom>=13] { line-pattern-file:url(img/road_5.png); }
    [zoom>=14] { line-pattern-file:url(img/road_8.png); }
    [zoom>=15] { line-pattern-file:url(img/road_16.png); }
    [zoom>=16] { line-pattern-file:url(img/road_20.png); }
  }
  [type='taxiway'] {
    [zoom>=13] { line-pattern-file:url(img/road_2.png); }
    [zoom>=14] { line-pattern-file:url(img/road_3.png); }
    [zoom>=15] { line-pattern-file:url(img/road_4.png); }
    [zoom>=16] { line-pattern-file:url(img/road_6.png); }
  }
}

// Buildings //

#building::fill[zoom>=13][zoom<=22] {
  polygon-pattern-file:url(img/halftone_15_medium.png);
  polygon-pattern-alignment:global;
  polygon-pattern-clip:false;
  
  line-color:@dark;
  line-width:1;
  line-clip:false;
}

#building::shadow[zoom>=16] {
  line-color:@dark;
  line-width:3;
  line-join:round;
  line-cap:round;
  line-clip:false;
  line-geometry-transform:translate(0,2);
  polygon-fill:@dark;
  polygon-geometry-transform:translate(0,2);
  
  a/polygon-fill: @light;
}

// Roads & Railways //

#road::case,
#tunnel::case,
#bridge::case {
  [class='motorway']['mapnik::geometry_type'=2] {
    [zoom>=9] { line-pattern-file:url(img/road_6.png); }
    [zoom>=11]{ line-pattern-file:url(img/road_7.png); }
    [zoom>=13]{ line-pattern-file:url(img/road_9.png); }
  }
  [class='motorway_link']['mapnik::geometry_type'=2],
  [class='main']['mapnik::geometry_type'=2] {
    [zoom>=11] { line-pattern-file:url(img/road_4.png); }
    [zoom>=13] { line-pattern-file:url(img/road_6.png); }
    [zoom>=16] { line-pattern-file:url(img/road_8.png); }
  }
  [class='street']['mapnik::geometry_type'=2],
  [class='street_limited']['mapnik::geometry_type'=2] {
    [zoom>=13] {  line-pattern-file:url(img/road_4.png); }
    [zoom>=16] {  line-pattern-file:url(img/road_6.png); }
  }
}

#road::fill,
#tunnel::fill,
#bridge::fill {
  [class='motorway']['mapnik::geometry_type'=2][zoom>=9] {
    line-color: @light;
    line-join:round;
    line-cap:round;
    line-width: 1.6;
    [zoom>=11] { line-width: 2; }
    [zoom>=13] { line-width: 3; }
  }
  [class='motorway_link']['mapnik::geometry_type'=2][zoom>=11],
  [class='main']['mapnik::geometry_type'=2][zoom>=11] {
    line-color: @light;
    line-join:round;
    line-cap:round;
    line-width: 1;
    [zoom>=13] { line-width: 1.6; }
    [zoom>=16] { line-width: 3; }
  }
  [class='street']['mapnik::geometry_type'=2][zoom>=13],
  [class='street_limited']['mapnik::geometry_type'=2][zoom>=13] {
    line-color: @light;
    line-join:round;
    line-cap:round;
    line-width: 1.2;
    [zoom>=16] { line-width: 2.4; }
  }
}

#bridge {
  ::case, ::fill {
  	[class='motorway']['mapnik::geometry_type'=2][zoom>=9],
    [class='motorway_link']['mapnik::geometry_type'=2][zoom>=11],
    [class='main']['mapnik::geometry_type'=2][zoom>=11]{
      line-cap:butt;
    }
  }
}