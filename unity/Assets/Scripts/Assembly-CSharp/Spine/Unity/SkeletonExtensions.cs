using UnityEngine;

namespace Spine.Unity
{
	public static class SkeletonExtensions
	{
		private const float ByteToFloat = 0.003921569f;

		public static Color GetColor(this Skeleton s)
		{
			return default(Color);
		}

		public static Color GetColor(this RegionAttachment a)
		{
			return default(Color);
		}

		public static Color GetColor(this MeshAttachment a)
		{
			return default(Color);
		}

		public static Color GetColor(this Slot s)
		{
			return default(Color);
		}

		public static Color GetColorTintBlack(this Slot s)
		{
			return default(Color);
		}

		public static void SetColor(this Skeleton skeleton, Color color)
		{
		}

		public static void SetColor(this Skeleton skeleton, Color32 color)
		{
		}

		public static void SetColor(this Slot slot, Color color)
		{
		}

		public static void SetColor(this Slot slot, Color32 color)
		{
		}

		public static void SetColor(this RegionAttachment attachment, Color color)
		{
		}

		public static void SetColor(this RegionAttachment attachment, Color32 color)
		{
		}

		public static void SetColor(this MeshAttachment attachment, Color color)
		{
		}

		public static void SetColor(this MeshAttachment attachment, Color32 color)
		{
		}

		public static void SetPosition(this Bone bone, Vector2 position)
		{
		}

		public static void SetPosition(this Bone bone, Vector3 position)
		{
		}

		public static Vector2 GetLocalPosition(this Bone bone)
		{
			return default(Vector2);
		}

		public static Vector2 GetSkeletonSpacePosition(this Bone bone)
		{
			return default(Vector2);
		}

		public static Vector2 GetSkeletonSpacePosition(this Bone bone, Vector2 boneLocal)
		{
			return default(Vector2);
		}

		public static Vector3 GetWorldPosition(this Bone bone, Transform spineGameObjectTransform)
		{
			return default(Vector3);
		}

		public static Vector3 GetWorldPosition(this Bone bone, Transform spineGameObjectTransform, float positionScale)
		{
			return default(Vector3);
		}

		public static Quaternion GetQuaternion(this Bone bone)
		{
			return default(Quaternion);
		}

		public static Quaternion GetLocalQuaternion(this Bone bone)
		{
			return default(Quaternion);
		}

		public static Matrix4x4 GetMatrix4x4(this Bone bone)
		{
			return default(Matrix4x4);
		}

		public static void GetWorldToLocalMatrix(this Bone bone, out float ia, out float ib, out float ic, out float id)
		{
			ia = default(float);
			ib = default(float);
			ic = default(float);
			id = default(float);
		}

		public static Vector2 WorldToLocal(this Bone bone, Vector2 worldPosition)
		{
			return default(Vector2);
		}

		public static Vector2 SetPositionSkeletonSpace(this Bone bone, Vector2 skeletonSpacePosition)
		{
			return default(Vector2);
		}

		public static Material GetMaterial(this Attachment a)
		{
			return null;
		}

		public static Vector2[] GetLocalVertices(this VertexAttachment va, Slot slot, Vector2[] buffer)
		{
			return null;
		}

		public static Vector2[] GetWorldVertices(this VertexAttachment a, Slot slot, Vector2[] buffer)
		{
			return null;
		}

		public static Vector3 GetWorldPosition(this PointAttachment attachment, Slot slot, Transform spineGameObjectTransform)
		{
			return default(Vector3);
		}

		public static Vector3 GetWorldPosition(this PointAttachment attachment, Bone bone, Transform spineGameObjectTransform)
		{
			return default(Vector3);
		}
	}
}
