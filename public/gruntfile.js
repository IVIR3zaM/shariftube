'use strict';
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
	grunt.registerTask('default', ['stylus', 'autoprefixer', 'watch']);
};