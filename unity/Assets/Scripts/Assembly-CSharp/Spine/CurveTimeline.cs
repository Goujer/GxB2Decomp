namespace Spine
{
	public abstract class CurveTimeline : Timeline
	{
		protected const float LINEAR = 0f;

		protected const float STEPPED = 1f;

		protected const float BEZIER = 2f;

		protected const int BEZIER_SIZE = 19;

		internal float[] curves;

		public int FrameCount
		{
			get
			{
				return 0;
			}
		}

		public abstract int PropertyId { get; }

		public CurveTimeline(int frameCount)
		{
		}

		public abstract void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction);

		public void SetLinear(int frameIndex)
		{
		}

		public void SetStepped(int frameIndex)
		{
		}

		public void SetCurve(int frameIndex, float cx1, float cy1, float cx2, float cy2)
		{
		}

		public float GetCurvePercent(int frameIndex, float percent)
		{
			return 0f;
		}

		public float GetCurveType(int frameIndex)
		{
			return 0f;
		}
	}
}
