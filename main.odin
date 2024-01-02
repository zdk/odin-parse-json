package load_json

import "core:fmt"
import "core:encoding/json"

import "core:os"

main :: proc() {
	data, ok := os.read_entire_file_from_filename("example.json")
	if !ok {
		fmt.eprintln("Read file failed!")
		return
	}
	defer delete(data) // Free the memory.
	
	json_data, err := json.parse(data)
	if err != .None {
		fmt.eprintln("Error:", err)
		return
	}
	defer json.destroy_value(json_data)

	obj := json_data.(json.Object)

	fmt.println(obj)
}
