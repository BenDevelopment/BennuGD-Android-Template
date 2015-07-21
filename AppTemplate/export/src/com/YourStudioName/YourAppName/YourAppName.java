package com.YourStudioName.YourAppName;

import org.libsdl.app.SDLActivity;
import android.os.*;
// import android.view.*;

public class YourAppName extends SDLActivity {
    protected void onCreate(Bundle savedInstanceState) {
		// getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                // | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                // | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                // | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                // | View.SYSTEM_UI_FLAG_FULLSCREEN
                // | View.SYSTEM_UI_FLAG_IMMERSIVE);
        super.onCreate(savedInstanceState);
    }
    
    protected void onDestroy() {
        super.onDestroy();
    }
}
