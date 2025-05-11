using System.Text;
using UnityEngine;

public class KeyboardWrapper
{
	private static KeyboardWrapper _instance;

	private int _leftMoveLen;

	private int _composingLen;

	private bool _isComposingBeforeInput;

	private int _isLateralMoveState;

	private bool _active;

	private bool _visible;

	private StringBuilder _buffSB;

	private TouchScreenKeyboard mKeyboard;

	private bool _done;

	public TouchScreenKeyboard Keyboard
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public static KeyboardWrapper Instance
	{
		get
		{
			return null;
		}
	}

	public bool isComposing
	{
		get
		{
			return false;
		}
	}

	public int composingLen
	{
		get
		{
			return 0;
		}
	}

	public bool isComposingBeforeInput
	{
		get
		{
			return false;
		}
	}

	public int isLateralMoveState
	{
		get
		{
			return 0;
		}
	}

	public int leftMoveLen
	{
		get
		{
			return 0;
		}
	}

	public bool active
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public bool done
	{
		get
		{
			return false;
		}
		private set
		{
		}
	}

	public static bool hideInput { get; set; }

	public int targetDisplay { get; set; }

	public string text
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public bool visible
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public bool wasCanceled
	{
		get
		{
			return false;
		}
	}

	public KeyboardWrapper()
	{
	}

	public KeyboardWrapper(TouchScreenKeyboard keyboard)
	{
	}

	public void Reset()
	{
	}

	private void _moveLeft(int len)
	{
	}

	private void _removeComposingText(int len)
	{
	}

	public void commitText(string text)
	{
	}

	public void ComposingTextEvent(string text)
	{
	}

	public void FinishComposingTextEvent()
	{
	}

	public void DeleteSurroundingText(int beforeLen, int afterLen)
	{
	}

	public void ComposingRegionEvent(int length)
	{
	}

	public void DPadLateralMoveEvent(int state)
	{
	}

	public void ResetLateralMoveType(int state)
	{
	}

	public static KeyboardWrapper Open(string text)
	{
		return null;
	}

	public static KeyboardWrapper Open(string text, TouchScreenKeyboardType keyboardType)
	{
		return null;
	}

	public static KeyboardWrapper Open(string text, TouchScreenKeyboardType keyboardType, bool autocorrection)
	{
		return null;
	}

	public static KeyboardWrapper Open(string text, TouchScreenKeyboardType keyboardType, bool autocorrection, bool multiline)
	{
		return null;
	}

	public static KeyboardWrapper Open(string text, TouchScreenKeyboardType keyboardType, bool autocorrection, bool multiline, bool secure)
	{
		return null;
	}

	public static KeyboardWrapper Open(string text, TouchScreenKeyboardType keyboardType, bool autocorrection, bool multiline, bool secure, bool alert)
	{
		return null;
	}

	public static KeyboardWrapper Open(string text, TouchScreenKeyboardType keyboardType, bool autocorrection, bool multiline, bool secure, bool alert, string textPlaceholder)
	{
		return null;
	}
}
