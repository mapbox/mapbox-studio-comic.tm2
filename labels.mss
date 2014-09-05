// Places //

//Komika Font// 
/*
@regular: 'Komika Title Regular';
@bold: 'Komika Hand Bold';n
@italic: 'Komika Hand Italic';
*/

//Market Font// 
@regular: 'Market Offc Pro Regular';
@bold: 'Market Offc Pro Bold';
@italic: 'Market Offc Pro Regular';


#country_label[zoom>=3] {
  //passing the name from the vector tile and passing it to the renderer as an argument
  //adding "!" for excitement and satisfaction
  text-name: "[name_en] + '!'";
  text-transform: uppercase;
  text-face-name: @regular;
  text-wrap-width: 100;
  text-wrap-before: true;
  text-fill: @medium;
  text-size: 16;
  text-halo-fill: @dark;
  text-halo-radius:3;
  text-line-spacing:-10;
  
  [zoom>=3][scalerank=1],
  [zoom>=4][scalerank=2],
  [zoom>=5][scalerank=3],
  [zoom>=6][scalerank>3] {
    text-size: 20;
  }
  
  [zoom>=4][scalerank=1],
  [zoom>=5][scalerank=2],
  [zoom>=6][scalerank=3],
  [zoom>=7][scalerank>3] {
    text-size: 28;
  }
}

#country_label_line {
  line-color: @medium;
}

#place_label {
    text-size: 0;
    text-name: @name;
    text-face-name: @regular;
    text-fill: @dark;
    text-wrap-width: 100;
    text-wrap-before: true;
    text-halo-fill: @light;
    text-halo-radius:3;
    text-line-spacing:-6;
    text-transform: uppercase;
  
  [type='city'][zoom>=5][localrank=1] {
    text-size: 18;
    text-name: "[name_en] + '!'";
    text-face-name: @bold;
    text-size: 18;
    text-wrap-width: 150;
    [zoom>=10] { text-size: 18; }
    [zoom>=12] { text-size: 24; }
  }
  [type='town'][zoom>=8][localrank=1] {
    text-size: 14;
    [zoom>=10] { text-size: 16; }
    [zoom>=12] { text-size: 20; }
  }
  [type='village'][localrank=1] {
    text-size: 12;
    [zoom>=12] { text-size: 14; }
    [zoom>=14] { text-size: 18; }
  }
  [type='hamlet'],
  [type='suburb'] {
    //text-size: 12;
    [zoom>=14] { text-size: 14; }
    [zoom>=16] { text-size: 16; }
  }
}

#water_label {
  [zoom<=13],  // automatic area filtering @ low zooms
  [zoom>=14][area>500000],
  [zoom>=16][area>10000],
  [zoom>=17] {
    text-name: @name;
    text-face-name: @regular;
    text-fill: @light;
    text-size: 12;
    text-wrap-width: 160;
    text-wrap-before: true;
    text-line-spacing:-4;
    text-halo-fill: @dark;
    text-halo-radius:2;
  }
}

#poi_label[type='Aerodrome'][maki!='heliport'] {
  text-name:@name;
  text-face-name: @regular;
  text-fill:@dark;
  text-halo-fill:@light;
  text-wrap-width: 160;
  text-wrap-before: true;
  text-line-spacing:-4;
  text-halo-radius:2;
  text-size:12;
  [zoom>=12] { text-name:@name; }
  [zoom>=13] { text-size: 14; }
}


#poi_label[type!='Aerodrome'] {
  [zoom<14],
  [zoom>=14][scalerank=1][localrank<=1],
  [zoom>=15][scalerank<=2][localrank<=1],
  [zoom>=16][scalerank<=3][localrank<=1],
  [zoom>=17][scalerank<=3] {
    text-name: @name;
    text-face-name: @italic;
    text-fill: @medium;
    text-size: 13;
    text-wrap-width: 100;
    text-wrap-before: true;
    text-halo-fill: @light;
    text-halo-radius:2;
    text-line-spacing: -5;
    [maki='cemetery'],
    [maki='golf'],
    [maki='park'],
    [maki='zoo'] {
      text-fill: @light;
      text-halo-fill: @medium;
  	}
  }
}