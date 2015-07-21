package com.YourStudioName.YourAppName;

import org.libsdl.app.SDLActivity;
import android.os.*;
// import android.view.*;

/*
 * A sample wrapper class that just calls SDLActivity
 */ 

public class YourAppName extends SDLActivity {
    protected void onCreate(Bundle savedInstanceState) {
		// getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_IMMERSIVE);
        super.onCreate(savedInstanceState);
    }
    
    protected void onDestroy() {
        super.onDestroy();
    }
}
