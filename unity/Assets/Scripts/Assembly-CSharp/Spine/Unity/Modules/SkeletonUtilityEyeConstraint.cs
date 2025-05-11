using UnityEngine;

namespace Spine.Unity.Modules
{
	public class SkeletonUtilityEyeConstraint : SkeletonUtilityConstraint
	{
		public Transform[] eyes;

		public float radius;

		public Transform target;

		public Vector3 targetPosition;

		public float speed;

		private Vector3[] origins;

		private Vector3 centerPoint;

		protected override void OnEnable()
		{
		}

		protected override void OnDisable()
		{
		}

		public override void DoUpdate()
		{
		}
	}
}
