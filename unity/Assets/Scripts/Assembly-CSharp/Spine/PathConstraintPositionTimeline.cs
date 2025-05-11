namespace Spine
{
	public class PathConstraintPositionTimeline : CurveTimeline
	{
		public const int ENTRIES = 2;

		protected const int PREV_TIME = -2;

		protected const int PREV_VALUE = -1;

		protected const int VALUE = 1;

		internal int pathConstraintIndex;

		internal float[] frames;

		public override int PropertyId
		{
			get
			{
				return 0;
			}
		}

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

		public PathConstraintPositionTimeline(int frameCount)
			: base(0)
		{
		}

		public void SetFrame(int frameIndex, float time, float value)
		{
		}

		public override void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction)
		{
		}
	}
}
