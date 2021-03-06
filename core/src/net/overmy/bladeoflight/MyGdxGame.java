package net.overmy.bladeoflight;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.ApplicationAdapter;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Screen;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;
import com.badlogic.gdx.utils.Logger;

import net.overmy.bladeoflight.logic.DynamicLevels;
import net.overmy.bladeoflight.resources.Assets;
import net.overmy.bladeoflight.resources.GameColor;
import net.overmy.bladeoflight.resources.MusicAsset;
import net.overmy.bladeoflight.resources.Settings;
import net.overmy.bladeoflight.screen.GameScreen;
import net.overmy.bladeoflight.screen.LoadingScreen;
import net.overmy.bladeoflight.screen.MenuScreen;

public class MyGdxGame extends ApplicationAdapter {

	private boolean disableRender = false;

	private Screen screen = null;

	private final float r;
	private final float g;
	private final float b;


	public MyGdxGame () {
		r = GameColor.BG.get().r;
		g = GameColor.BG.get().g;
		b = GameColor.BG.get().b;
	}


	@Override
	public void create () {
		Gdx.app.setLogLevel( Application.LOG_DEBUG );
		Settings.load();
		Assets.init();
		Assets.setManagerLogLevel( Logger.NONE );

		BulletWorld.init();
		MyRender.init();// Здесь создание всех камер (2д и 3д) и всех батчей (2д, 3д и Декали)
		AshleyWorld.init();

		//MyPlayer.clearAll();

		// Создание и загрузка уровней
		DynamicLevels.init();

		switchTo( SCREEN_TYPE.LOADING_MENU );
	}


	@Override
	public void resize ( int width, int height ) {
		Core.resize( width, height );
		screen.resize( width, height );
	}


	@Override
	public void render () {
		if ( disableRender ) {
			return;
		}

		Gdx.gl.glClearColor( r, g, b, 1 );
		Gdx.gl.glClear( GL20.GL_COLOR_BUFFER_BIT | GL20.GL_DEPTH_BUFFER_BIT );

		screen.render( Gdx.graphics.getDeltaTime() );
	}


	@Override
	public void pause () {
		disableRender = true;
		screen.pause();
	}


	@Override
	public void resume () {
		Assets.getManager().update();
		Assets.getManager().finishLoading();

		disableRender = false;
		screen.resume();
	}


	@Override
	public void dispose () {
		MusicAsset.stopAll();

		AshleyWorld.dispose();
		BulletWorld.dispose();
		Assets.unload();
		MyRender.dispose();
	}


	public void switchTo ( final SCREEN_TYPE screenType ) {
		if ( screen != null ) {
			disableRender = true;
			screen.hide();
			screen.dispose();
		}

		if ( DEBUG.anything() ) {
			Gdx.app.debug( "► Screen switch to", screenType.toString() );
		}

		switch ( screenType ) {
			case LOADING_MENU:
				screen = new LoadingScreen( this, SCREEN_TYPE.MENU );
				break;

			case LOADING_GAME:
				screen = new LoadingScreen( this, SCREEN_TYPE.GAME );
				break;

			case MENU:
				screen = new MenuScreen( this );
				break;

			case GAME:
				screen = new GameScreen( this );
				break;

			case EXIT:
				Gdx.app.exit();
				return;
		}

		disableRender = false;
		screen.show();
	}


	public enum SCREEN_TYPE {
		LOADING_MENU, LOADING_GAME, MENU, GAME, EXIT
	}
}
