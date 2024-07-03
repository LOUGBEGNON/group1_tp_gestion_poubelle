/**
* Name: gesionpoubelle
* Based on the internal empty template. 
* Author: lougbegnon
* Tags: 
*/
model gesionpoubelle

/* Insert your model definition here */
global {
	file shape_file_bac <- file("../includes/bac_ordure.shp");
	file shape_file_building <- file("../includes/building_polygon.shp");
	file shape_file_route <- file("../includes/highway_line.shp");
	
	geometry shape <- envelope(shape_file_route);

	init {
		create Bac_ordure from: shape_file_bac;
		create Building_polygon from: shape_file_building;
		create Building_polygon from: shape_file_route;
	}
		
	}

}

species Bac_ordure {
	rgb couleur <- #black;

	aspect base {
		draw shape color: couleur;
	}

}

species Building_polygon {
	rgb couleur <- #blue;

	aspect base {
		draw shape color: couleur depth: 10;
	}

}

/* Insert your model definition here */
experiment gesionpoubelle type: gui {
	output {
		display city_display type: 3d {
		//image "../includes/satellite.png";
			species Bac_ordure aspect: base;
			species Building_polygon aspect: base;
		}

	}

}