using UnityEngine;

namespace Spine.Unity.Modules
{
	[ExecuteInEditMode]
	public class SkeletonUtilityGroundConstraint : SkeletonUtilityConstraint
	{
		public LayerMask groundMask;

		public bool use2D;

		public bool useRadius;

		public float castRadius;

		public float castDistance;

		public float castOffset;

		public float groundOffset;

		public float adjustSpeed;

		private Vector3 rayOrigin;

		private Vector3 rayDir;

		private float hitY;

		private float lastHitY;

		protected override void OnEnable()
		{
		}

		public override void DoUpdate()
		{
		}

		private void OnDrawGizmos()
		{
		}
	}
}
