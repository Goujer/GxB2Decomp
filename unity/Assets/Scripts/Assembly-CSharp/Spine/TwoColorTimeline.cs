namespace Spine
{
	public class TwoColorTimeline : CurveTimeline
	{
		public const int ENTRIES = 8;

		protected const int PREV_TIME = -8;

		protected const int PREV_R = -7;

		protected const int PREV_G = -6;

		protected const int PREV_B = -5;

		protected const int PREV_A = -4;

		protected const int PREV_R2 = -3;

		protected const int PREV_G2 = -2;

		protected const int PREV_B2 = -1;

		protected const int R = 1;

		protected const int G = 2;

		protected const int B = 3;

		protected const int A = 4;

		protected const int R2 = 5;

		protected const int G2 = 6;

		protected const int B2 = 7;

		internal int slotIndex;

		internal float[] frames;

		public int SlotIndex
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
		}

		public override int PropertyId
		{
			get
			{
				return 0;
			}
		}

		public TwoColorTimeline(int frameCount)
			: base(0)
		{
		}

		public void SetFrame(int frameIndex, float time, float r, float g, float b, float a, float r2, float g2, float b2)
		{
		}

		public override void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction)
		{
		}
	}
}
