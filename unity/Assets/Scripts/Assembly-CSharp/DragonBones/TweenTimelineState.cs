namespace DragonBones
{
	internal abstract class TweenTimelineState : TimelineState
	{
		protected TweenType _tweenType;

		protected int _curveCount;

		protected float _framePosition;

		protected float _frameDurationR;

		protected float _tweenProgress;

		protected float _tweenEasing;

		private static float _GetEasingValue(TweenType tweenType, float progress, float easing)
		{
			return 0f;
		}

		private static float _GetEasingCurveValue(float progress, short[] samples, int count, int offset)
		{
			return 0f;
		}

		protected override void _OnClear()
		{
		}

		protected override void _OnArriveAtFrame()
		{
		}

		protected override void _OnUpdateFrame()
		{
		}
	}
}
