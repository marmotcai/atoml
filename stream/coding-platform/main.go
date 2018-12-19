package main

import (
	"bytes"
	"fmt"
	"github.com/astaxie/beego"
	_ "github.com/marmotcai/atoml/stream/coding-platform/routers"
	"log"
	"os/exec"
)

func Transform(source string) *bytes.Buffer {
	cmd := exec.Command("ffmpeg",
		"-i", source,
		"-codec", "copy", "-vbsf", "h264_mp4toannexb", "-map", "0",
		"-f", "segment", "-segment_list", "out.m3u8", "-segment_time", "10", "out%03d.ts")
	// cmd := exec.Command("ffmpeg", "-i", filename, "-vframes", "1", "-s", fmt.Sprintf("%dx%d", width, height), "-f", "singlejpeg", "-")

	buf := new(bytes.Buffer)

	cmd.Stdout = buf

	if cmd.Run() != nil {
		log.Println("could not generate frame")
	}

	return buf
}

func main() {
	filename := "/Users/andrewcai/Myfiles/samples/samples.mp4"
	Transform(filename)

//	var inputdir = beego.AppConfig.String("inputdir")
//	var outputdir = beego.AppConfig.String("outputdir")

//	var inputfile = "sample.mp4"
//	var outputfile = "output.mp4"

//	var ffmpegcmd = fmt.Sprintf("docker run --rm=true -v %s:/input -v %s:/output atoml/ffmpeg -stats -y -i /input/%s -c:v libx265 -pix_fmt yuv420p10 -t 5 -f mp4 /output/%s",
//		inputdir, outputdir, inputfile, outputfile)

	// log.Println(GetFrame(10))
	var ffmpegcmd = "-f avfoundation -list_devices true -i \"\""
	log.Println(ffmpegcmd)

	cmd := exec.Command("ffmpeg", "-devices")
	out, err := cmd.Output()

	if err != nil {
		log.Println(err)
	}

	fmt.Println(string(out))

	beego.Run()
}

