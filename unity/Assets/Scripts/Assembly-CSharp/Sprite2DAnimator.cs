using System.Collections.Generic;
using UnityEngine;

public class Sprite2DAnimator : MonoBehaviour
{
	public Sprite2DAnimation currAnimation;

	public Sprite2DAnimation[] animations;

	public SpriteRenderer spRenderer;

	public LuaAnimationEvent luaAnimeEvent;

	public bool autoPlay;

	private float mTimer;

	private int mIndex;

	private int mFrame;

	private bool mIsPlaying;

	public static Dictionary<string, Material> AnimMaterials;

	private MulSpriteAtlas _mulSpriteAtlas;

	private AbstractLoader _loader;

	public bool isPlaying
	{
		get
		{
			return false;
		}
	}

	private void Start()
	{
	}

	private void Update()
	{
	}

	public bool Play(Sprite2DAnimation animation, float normalize = 0f)
	{
		return false;
	}

	public bool Play(string name, float normalize = 0f)
	{
		return false;
	}

	public bool Play(int index, float normalize = 0f)
	{
		return false;
	}

	public void Pause()
	{
	}

	public void Resume()
	{
	}

	public void Stop()
	{
	}

	public Sprite2DAnimation GetAnimation(string name)
	{
		return null;
	}

	private void OnDestroy()
	{
	}
}
