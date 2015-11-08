'use strict';
// Be sure to change the relative path next time for grunt
module.exports = function(grunt){
	// scripts
	grunt.initConfig ({
		stylus: {
			compile: {
				options: {
					compress: false,
					paths: ['stylus']
				},
				files: {
					'frontend/css/main.css':'stylus/main.styl',
				}
			}
		},
		autoprefixer: {
			compile: {
				files: {
					'frontend/css/main.css':'frontend/css/main.css'
				}
			}
		},
		cssmin: {
			compile: {
				files: {
					'../public/css/shariftube.min.css' : ['frontend/css/bootstrap.min.css', 'frontend/css/font-awesome.css', 'frontend/css/main.css']
				}
			}
		},
		uglify: {
			js_files: {
				files: {
					// jQuery must be first in order not to be warned by bootstrap js
					'../public/js/shariftube.min.js' : ['frontend/js/jquery.min.js', 'frontend/js/bootstrap.min.js', 'frontend/js/leech.js', 'frontend/js/shariftube.js', 'frontend/js/jwplayer.js']
				}
			}
		},
		watch: {
			css: {
				files: ['stylus/*.styl'],
				tasks: ['stylus', 'autoprefixer', 'cssmin']
			},
			js: {
				files: ['frontend/js/*'],
				tasks: ['uglify']
			}
		}
	});
	

	//load tasks and register tasks
	grunt.loadNpmTasks('grunt-contrib-stylus');
	grunt.loadNpmTasks('grunt-autoprefixer');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.registerTask('default', ['stylus', 'autoprefixer', 'watch']);
	grunt.registerTask('production', ['stylus', 'autoprefixer', 'cssmin', 'uglify', 'watch']);
	grunt.registerTask('minify', ['cssmin', 'uglify']);
};