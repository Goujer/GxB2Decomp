using System.Collections.Generic;

namespace Spine
{
	public static class SkeletonExtensions
	{
		public static bool IsWeighted(this VertexAttachment va)
		{
			return false;
		}

		public static bool IsRenderable(this Attachment a)
		{
			return false;
		}

		public static bool InheritsRotation(this TransformMode mode)
		{
			return false;
		}

		public static bool InheritsScale(this TransformMode mode)
		{
			return false;
		}

		internal static void SetPropertyToSetupPose(this Skeleton skeleton, int propertyID)
		{
		}

		public static void SetDrawOrderToSetupPose(this Skeleton skeleton)
		{
		}

		public static void SetColorToSetupPose(this Slot slot)
		{
		}

		public static void SetAttachmentToSetupPose(this Slot slot)
		{
		}

		public static void SetSlotAttachmentToSetupPose(this Skeleton skeleton, int slotIndex)
		{
		}

		public static void PoseWithAnimation(this Skeleton skeleton, string animationName, float time, bool loop = false)
		{
		}

		public static void PoseSkeleton(this Animation animation, Skeleton skeleton, float time, bool loop = false)
		{
		}

		public static void SetKeyedItemsToSetupPose(this Animation animation, Skeleton skeleton)
		{
		}

		public static void FindNamesForSlot(this Skin skin, string slotName, SkeletonData skeletonData, List<string> results)
		{
		}

		public static void FindAttachmentsForSlot(this Skin skin, string slotName, SkeletonData skeletonData, List<Attachment> results)
		{
		}
	}
}
