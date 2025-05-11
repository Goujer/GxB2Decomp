namespace Spine
{
	public class ScaleTimeline : TranslateTimeline
	{
		public override int PropertyId
		{
			get
			{
				return 0;
			}
		}

		public ScaleTimeline(int frameCount)
			: base(0)
		{
		}

		public override void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction)
		{
		}
	}
}
