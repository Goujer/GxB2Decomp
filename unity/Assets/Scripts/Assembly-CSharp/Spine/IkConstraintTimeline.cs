namespace Spine
{
	public class IkConstraintTimeline : CurveTimeline
	{
		public const int ENTRIES = 3;

		private const int PREV_TIME = -3;

		private const int PREV_MIX = -2;

		private const int PREV_BEND_DIRECTION = -1;

		private const int MIX = 1;

		private const int BEND_DIRECTION = 2;

		internal int ikConstraintIndex;

		internal float[] frames;

		public int IkConstraintIndex
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

		public IkConstraintTimeline(int frameCount)
			: base(0)
		{
		}

		public void SetFrame(int frameIndex, float time, float mix, int bendDirection)
		{
		}

		public override void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction)
		{
		}
	}
}
