namespace DragonBones
{
	public class EllipseBoundingBoxData : BoundingBoxData
	{
		public static int EllipseIntersectsSegment(float xA, float yA, float xB, float yB, float xC, float yC, float widthH, float heightH, Point intersectionPointA = null, Point intersectionPointB = null, Point normalRadians = null)
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

		public override int IntersectsSegment(float xA, float yA, float xB, float yB, Point intersectionPointA, Point intersectionPointB, Point normalRadians)
		{
			return 0;
		}
	}
}
