namespace Spine
{
	public class TranslateTimeline : CurveTimeline
	{
		public const int ENTRIES = 3;

		protected const int PREV_TIME = -3;

		protected const int PREV_X = -2;

		protected const int PREV_Y = -1;

		protected const int X = 1;

		protected const int Y = 2;

		internal int boneIndex;

		internal float[] frames;

		public int BoneIndex
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

		public TranslateTimeline(int frameCount)
			: base(0)
		{
		}

		public void SetFrame(int frameIndex, float time, float x, float y)
		{
		}

		public override void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction)
		{
		}
	}
}
