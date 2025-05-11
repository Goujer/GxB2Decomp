using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

public abstract class EmojiProvider
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate bool EmojiFilter(string text, EmojiVO symbol);

	public EmojiFilter emojiFilter;

	public virtual Texture mainTexture
	{
		get
		{
			return null;
		}
	}

	public virtual Material material
	{
		get
		{
			return null;
		}
	}

	public abstract bool HasEmojis(string text);

	public BMSymbol MatchEmoji(string text, int offset = 0)
	{
		return null;
	}

	public abstract BMSymbol MatchEmoji(string text, int offset, int length);

	public abstract Dictionary<string, EmojiVO> GetAllEmojis();

	public string U32ToUnicode(string str)
	{
		return null;
	}

	public ushort[] UCS4ToUTF16(uint UCS4)
	{
		return null;
	}
}
