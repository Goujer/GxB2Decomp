namespace Spine
{
	public class PathConstraintMixTimeline : CurveTimeline
	{
		public const int ENTRIES = 3;

		private const int PREV_TIME = -3;

		private const int PREV_ROTATE = -2;

		private const int PREV_TRANSLATE = -1;

		private const int ROTATE = 1;

		private const int TRANSLATE = 2;

		internal int pathConstraintIndex;

		internal float[] frames;

		public int PathConstraintIndex
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public float[] Frames
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public override int PropertyId
		{
			get
			{
				return 0;
			}
		}

		public PathConstraintMixTimeline(int frameCount)
			: base(0)
		{
		}

		public void SetFrame(int frameIndex, float time, float rotateMix, float translateMix)
		{
		}

		public override void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction)
		{
		}
	}
}
