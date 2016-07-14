/*
 * Mr. 4th Dimention - Allen Webster
 *
 * 28.08.2015
 *
 * Styles for 4coder
 *
 */

// TOP

struct Style_Font{
    i16 font_id;
};

struct Style{
    char name_[24];
    String name;
    Style_Main_Data main;
};

internal void
style_copy(Style *dst, Style *src){
    *dst = *src;
    dst->name.str = dst->name_;
}

internal void
style_set_name(Style *style, String name){
    i32 count = ArrayCount(style->name_);
    style->name = make_string(style->name_, 0, count - 1);
    copy(&style->name, name);
    terminate_with_null(&style->name);
}

struct Style_Library{
    Style styles[64];
    i32 count, max;
};

// BOTTOM

