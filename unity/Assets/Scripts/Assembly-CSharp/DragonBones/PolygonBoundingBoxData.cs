using System.Collections.Generic;

namespace DragonBones
{
	public class PolygonBoundingBoxData : BoundingBoxData
	{
		public float x;

		public float y;

		public readonly List<float> vertices;

		public static int PolygonIntersectsSegment(float xA, float yA, float xB, float yB, List<float> vertices, Point intersectionPointA = null, Point intersectionPointB = null, Point normalRadians = null)
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
