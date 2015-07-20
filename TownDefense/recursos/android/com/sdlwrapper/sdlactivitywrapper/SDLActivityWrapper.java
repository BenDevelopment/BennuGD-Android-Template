package com.sdlwrapper.sdlactivitywrapper;

import org.libsdl.app.SDLActivity;
import android.os.*;

/*
 * A sample wrapper class that just calls SDLActivity
 */ 

public class SDLActivityWrapper extends SDLActivity {
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }
    
    protected void onDestroy() {
        super.onDestroy();
    }
}
