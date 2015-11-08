'use strict';
// Be sure to change the relative path next time for grunt
module.exports = function(grunt){
	// scripts
	grunt.initConfig ({
		stylus: {
			compile: {
				options: {
					compress: false,
					paths: ['build/stylus']
				},
				files: {
					'css/main.css':'build/stylus/main.styl',
				}
			}
		},
		autoprefixer: {
			compile: {
				files: {
					'css/main.css':'css/main.css'
				}
			}
		},
		cssmin: {
			compile: {
				files: {
					'css/shariftube.min.css' : ['css/bootstrap.min.css', 'css/font-awesome.css', 'css/main.css']
				}
			}
		},
		uglify: {
			js_files: {
				files: {
					'js/shariftube.min.js' : ['js/jquery.min.js', 'js/bootstrap.min.js', 'js/leech.js', 'js/shariftube.js']
				}
			}
		},
		watch: {
			stylus: {
				files: ['build/stylus/*.styl'],
				tasks: ['stylus', 'autoprefixer']
			}
		}
	});
	

	//load tasks and register tasks
	grunt.loadNpmTasks('grunt-contrib-stylus');
	grunt.loadNpmTasks('grunt-autoprefixer');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-cssmin');
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-cache-bust');
	grunt.registerTask('default', ['stylus', 'autoprefixer', 'watch']);
	grunt.registerTask('minify', ['cssmin', 'uglify']);
};