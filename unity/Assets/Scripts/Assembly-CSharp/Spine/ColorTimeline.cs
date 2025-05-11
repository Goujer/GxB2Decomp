namespace Spine
{
	public class ColorTimeline : CurveTimeline
	{
		public const int ENTRIES = 5;

		protected const int PREV_TIME = -5;

		protected const int PREV_R = -4;

		protected const int PREV_G = -3;

		protected const int PREV_B = -2;

		protected const int PREV_A = -1;

		protected const int R = 1;

		protected const int G = 2;

		protected const int B = 3;

		protected const int A = 4;

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

		public ColorTimeline(int frameCount)
			: base(0)
		{
		}

		public void SetFrame(int frameIndex, float time, float r, float g, float b, float a)
		{
		}

		public override void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction)
		{
		}
	}
}
