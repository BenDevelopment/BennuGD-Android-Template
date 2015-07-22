package com.YourStudioName.YourAppName;

import org.libsdl.app.SDLActivity;
import android.os.*;
import android.view.*;

public class YourAppName extends SDLActivity {
	
	private void SetSystemUiVisibility()
	{
		getWindow().getDecorView().setSystemUiVisibility( View.SYSTEM_UI_FLAG_LAYOUT_STABLE
			| View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
			| View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
			| View.SYSTEM_UI_FLAG_HIDE_NAVIGATION // hide nav bar
			| View.SYSTEM_UI_FLAG_FULLSCREEN // hide status bar
			| View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
	}
	
    protected void onCreate(Bundle savedInstanceState) {
		SetSystemUiVisibility();
        super.onCreate(savedInstanceState);
    }
    
	@Override
    protected void onResume() {
		SetSystemUiVisibility();
        super.onResume();
    }	
	
    protected void onDestroy() {
        super.onDestroy();
    }	
}
