#!/usr/bin/make -f

all: rc.xml

rc.xml: 00_open.xml 01_resistance.xml 02_focus.xml 03_placement.xml 04_theme.xml 05_desktops.xml 06_resize.xml 07_margins.xml 08_dock.xml 09_keyboard.xml 10_mouse.xml 11_menu.xml 12_applications.xml 99_close.xml
		echo ""
		cat 00_open.xml 01_resistance.xml 02_focus.xml 03_placement.xml 04_theme.xml 05_desktops.xml 06_resize.xml 07_margins.xml 08_dock.xml 09_keyboard.xml 10_mouse.xml 11_menu.xml 12_applications.xml 99_close.xml> rc.xml.tmp
		mv rc.xml.tmp rc.xml

09_keyboard.xml:  09_01_desktop_switching.xml 09_02_windows.xml 09_03_windows_switching.xml 09_04_windows_switching_with_arrow_keys.xml 09_05_windows_tiling.xml 09_06_running.xml 09_07_toggle_fullscreen.xml 09_08_launchers.xml 09_09_lock_screen.xml 09_10_multimedia_keys.xml 09_11_LCD_backlight.xml 09_12_screenshot.xml 09_13_shutdown_button.xml
		cat 09_01_desktop_switching.xml 09_02_windows.xml 09_03_windows_switching.xml 09_04_windows_switching_with_arrow_keys.xml 09_05_windows_tiling.xml 09_06_running.xml 09_07_toggle_fullscreen.xml 09_08_launchers.xml 09_09_lock_screen.xml 09_10_multimedia_keys.xml 09_11_LCD_backlight.xml 09_12_screenshot.xml 09_13_shutdown_button.xml > 09_keyboard.xml.tmp
		mv 09_keyboard.xml.tmp 09_keyboard.xml 