namespace DragonBones
{
	public class RectangleBoundingBoxData : BoundingBoxData
	{
		private static int _ComputeOutCode(float x, float y, float xMin, float yMin, float xMax, float yMax)
		{
			return 0;
		}

		public static int RectangleIntersectsSegment(float xA, float yA, float xB, float yB, float xMin, float yMin, float xMax, float yMax, Point intersectionPointA = null, Point intersectionPointB = null, Point normalRadians = null)
		{
			return 0;
		}

		protected override void _OnClear()
		{
		}

		public override bool ContainsPoint(float pX, float pY)
		{
			return false;
		}

		public override int IntersectsSegment(float xA, float yA, float xB, float yB, Point intersectionPointA = null, Point intersectionPointB = null, Point normalRadians = null)
		{
			return 0;
		}
	}
}
