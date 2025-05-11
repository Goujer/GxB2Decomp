using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DefaultEmojiProvider : EmojiProvider
{
	private string mAtlasPath;

	private UIAtlas mAtlas;

	private Dictionary<string, EmojiVO> mEmojis;

	private Dictionary<int, EmojiVO> mEmojiMatchCache;

	private string mLastMatchText;

	private bool hasLoadAtlas;

	private static DefaultEmojiProvider mInstance;

	public static DefaultEmojiProvider instance
	{
		get
		{
			return null;
		}
	}

	public override Texture mainTexture
	{
		get
		{
			return null;
		}
	}

	public override Material material
	{
		get
		{
			return null;
		}
	}

	private DefaultEmojiProvider()
	{
	}

	private void LoadAtlas()
	{
	}

	private void LoadEmojis()
	{
	}

	public override Dictionary<string, EmojiVO> GetAllEmojis()
	{
		return null;
	}

	public virtual void CheckEmojiMatches(string text)
	{
	}

	public override BMSymbol MatchEmoji(string text, int offset, int length)
	{
		return null;
	}

	public override bool HasEmojis(string text)
	{
		return false;
	}

	public static bool IsNullOrEmpty(IEnumerable e)
	{
		return false;
	}
}
