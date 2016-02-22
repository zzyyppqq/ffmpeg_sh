
#yuv抓换成avi
ffmpeg -s 512x288 -i test.yuv -vcodec mpeg4 out.avi
#播放yuv
ffplay -f rawvideo -video_size 512x288 test.yuv
#播放flv
ffplay cuc_ieschool.flv
#视频分辨率太高,设置宽高,播放MP4
ffplay -autoexit -x 360 -y 640 letv.mp4

#ffmpeg从视频中生成gif图片： 未优化
ffmpeg -i letv.mp4 -t 14 -s 360x640 -r 10 aaa.gif
ffprobe -print_format json -show_format -show_streams -i aaa.gif
ffplay -autoexit aaa.gif

#第0秒开始持续14秒每秒取一张图片分辨率为360x640的图片(体积更小)
ffmpeg -ss 0 -t 14 -i letv.mp4 -r 1 -s 360x640 -f image2 foo-%03d.jpeg
ffmpeg -f image2 -framerate 5 -i foo-%03d.jpeg foo.gif
ffprobe -print_format json -show_format -show_streams -i foo.gif
rm *.jpeg
ffplay -autoexit foo.gif

ffmpeg -ss 0 -t 14 -i $1 -r 1 -s 360x640 -f image2 foo-%03d.jpeg
ffmpeg -f image2 -framerate 5 -i foo-%03d.jpeg $2
ffprobe -print_format json -show_format -show_streams -i $2
rm *.jpeg
ffplay -autoexit $2

#-print_format json（以json格式输出）， -show_format（输出封装格式信息），-show_streams（输出流信息）
ffprobe -print_format json -show_format -show_streams -i letv.mp4
