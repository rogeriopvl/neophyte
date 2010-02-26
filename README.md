# Neophyte

## Intro
Neophyte is a small tool that creates automatically the structure of a project.

The project is only in the beginning but you'll find usage examples bellow to give you a hint on what neophyte is about.

## Usage
### Default web project
	neo myproject

This will generate the following file structure on the current directory:
	
	myproject/
			 |_css/
			 |    |_main.css
			 |    |_reset.css
			 |_img/
			 |_js/
			 |   |_main.js
			 |_index.html

It will be possible to change the names of folders and the general structure by editing a simple config file. Also more projects formats will be supported by passing comand line options.