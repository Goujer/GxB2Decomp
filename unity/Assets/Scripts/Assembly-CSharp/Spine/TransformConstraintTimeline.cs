namespace Spine
{
	public class TransformConstraintTimeline : CurveTimeline
	{
		public const int ENTRIES = 5;

		private const int PREV_TIME = -5;

		private const int PREV_ROTATE = -4;

		private const int PREV_TRANSLATE = -3;

		private const int PREV_SCALE = -2;

		private const int PREV_SHEAR = -1;

		private const int ROTATE = 1;

		private const int TRANSLATE = 2;

		private const int SCALE = 3;

		private const int SHEAR = 4;

		internal int transformConstraintIndex;

		internal float[] frames;

		public int TransformConstraintIndex
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

		public TransformConstraintTimeline(int frameCount)
			: base(0)
		{
		}

		public void SetFrame(int frameIndex, float time, float rotateMix, float translateMix, float scaleMix, float shearMix)
		{
		}

		public override void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction)
		{
		}
	}
}
