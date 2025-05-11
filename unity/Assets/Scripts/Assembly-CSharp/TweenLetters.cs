using System;
using System.Collections.Generic;
using UnityEngine;

public class TweenLetters : UITweener
{
	[DoNotObfuscateNGUI]
	public enum AnimationLetterOrder
	{
		Forward = 0,
		Reverse = 1,
		Random = 2
	}

	private class LetterProperties
	{
		public float start;

		public float duration;

		public Vector2 offset;
	}

	[Serializable]
	public class AnimationProperties
	{
		public AnimationLetterOrder animationOrder;

		public float overlap;

		public bool randomDurations;

		public Vector2 randomness;

		public Vector2 offsetRange;

		public Vector3 pos;

		public Vector3 rot;

		public Vector3 scale;

		public float alpha;
	}

	public AnimationProperties hoverOver;

	public AnimationProperties hoverOut;

	private UILabel mLabel;

	private int mVertexCount;

	private int[] mLetterOrder;

	private LetterProperties[] mLetter;

	private AnimationProperties mCurrent;

	private void OnEnable()
	{
	}

	private void OnDisable()
	{
	}

	private void Awake()
	{
	}

	public override void Play(bool forward)
	{
	}

	private void OnPostFill(UIWidget widget, int bufferOffset, List<Vector3> verts, List<Vector2> uvs, List<Color> cols)
	{
	}

	protected override void OnUpdate(float factor, bool isFinished)
	{
	}

	private void SetLetterOrder(int letterCount)
	{
	}

	private void GetLetterDuration(int letterCount)
	{
	}

	private float ScaleRange(float value, float baseMax, float limitMax)
	{
		return 0f;
	}

	private static Vector3 GetCenter(List<Vector3> verts, int firstVert, int length)
	{
		return default(Vector3);
	}
}
