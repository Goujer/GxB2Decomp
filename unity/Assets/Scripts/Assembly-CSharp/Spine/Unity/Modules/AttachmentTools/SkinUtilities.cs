namespace Spine.Unity.Modules.AttachmentTools
{
	public static class SkinUtilities
	{
		public static Skin UnshareSkin(this Skeleton skeleton, bool includeDefaultSkin, bool unshareAttachments, AnimationState state = null)
		{
			return null;
		}

		public static Skin GetClonedSkin(this Skeleton skeleton, string newSkinName, bool includeDefaultSkin = false, bool cloneAttachments = false, bool cloneMeshesAsLinked = true)
		{
			return null;
		}

		public static Skin GetClone(this Skin original)
		{
			return null;
		}

		public static void SetAttachment(this Skin skin, string slotName, string keyName, Attachment attachment, Skeleton skeleton)
		{
		}

		public static Attachment GetAttachment(this Skin skin, string slotName, string keyName, Skeleton skeleton)
		{
			return null;
		}

		public static void SetAttachment(this Skin skin, int slotIndex, string keyName, Attachment attachment)
		{
		}

		public static bool RemoveAttachment(this Skin skin, string slotName, string keyName, Skeleton skeleton)
		{
			return false;
		}

		public static bool RemoveAttachment(this Skin skin, int slotIndex, string keyName)
		{
			return false;
		}

		public static void Clear(this Skin skin)
		{
		}

		public static void Append(this Skin destination, Skin source)
		{
		}

		public static void CopyTo(this Skin source, Skin destination, bool overwrite, bool cloneAttachments, bool cloneMeshesAsLinked = true)
		{
		}
	}
}
