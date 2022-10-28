use wasm_bindgen::prelude::*;

use chrono::*;

#[wasm_bindgen]
pub fn say_message() -> String {
    let now = Utc::now();
    format!("Hello, world! The time is: {}", now).into()
}
