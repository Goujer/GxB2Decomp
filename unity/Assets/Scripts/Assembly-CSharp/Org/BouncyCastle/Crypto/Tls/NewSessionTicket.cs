using System.IO;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class NewSessionTicket
	{
		protected readonly long mTicketLifetimeHint;

		protected readonly byte[] mTicket;

		public virtual long TicketLifetimeHint
		{
			get
			{
				return 0L;
			}
		}

		public virtual byte[] Ticket
		{
			get
			{
				return null;
			}
		}

		public NewSessionTicket(long ticketLifetimeHint, byte[] ticket)
		{
		}

		public virtual void Encode(Stream output)
		{
		}

		public static NewSessionTicket Parse(Stream input)
		{
			return null;
		}
	}
}
