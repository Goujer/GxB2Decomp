using System.Collections;
using System.Diagnostics;
using HTMLEngine;
using UnityEngine;

public class NGUIHTML : MonoBehaviour
{
	public enum AutoScrollType
	{
		MANUAL = 0,
		AUTO_TOP = 1,
		AUTO_BOTTOM = 2
	}

	public string _html;

	public int maxLineWidth;

	public int maxLineNums;

	public AutoScrollType autoScroll;

	public bool isMergeSameTextChunks;

	public static int LINE_GAP;

	public int newLineGap;

	public bool isArabicFlip;

	private bool changed;

	private HtCompiler compiler;

	public string html
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	private void Awake()
	{
	}

	private void Update()
	{
	}

	public void Execute()
	{
	}

	private void OnDestroy()
	{
	}

	[DebuggerHidden]
	private IEnumerator updateAutoScroll()
	{
		return null;
	}

	public int getCompilerHeight()
	{
		return 0;
	}

	public int getDrewHeight()
	{
		return 0;
	}

	public int getMaxWidth()
	{
		return 0;
	}

	public int getLineNum()
	{
		return 0;
	}
}
