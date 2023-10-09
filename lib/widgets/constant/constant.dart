import 'package:flutter/material.dart';
import 'package:virtualguide/widgets/constant/theme/light_theme.dart';

class VirtualGuide {

  static const padding = 10.0;
  static const height = 10.0;
  static const width = 10.0;

  // Category
  static const chat = "chat";
  static const writingAnArticles = "writingAnArticles";
  static const academicWriter = "academicWriter";
  static const summarize = "summarize";
  static const grammarCorrection = "grammarCorrection";
  static const songAndLyrics = "songAndLyrics";
  static const storyteller = "storyteller";
  static const poems = "poems";
  static const movieScript = "movieScript";
  static const emailWriter = "emailWriter";
  static const interviewQuestions = "interviewQuestions";
  static const jobPost = "jobPost";
  static const advertisements = "advertisements";
  static const linkedin = "linkedin";
  static const instagram = "instagram";
  static const twitter = "twitter";
  static const facebook = "facebook";
  static const birthday = "birthday";
  static const apology = "apology";
  static const invitation = "invitation";
  static const tellAJoke = "tellAJoke";
  static const foodRecipes = "foodRecipes";
  static const dietPlan = "dietPlan";
  static const explainCode = "explainCode";
  static const writeCode = "writeCode";

  // Ai Assistant Features List
  static List aiAssistantsData = [
    {
      "title": "All",
      "slug": "all",
      "feature": [
        {
          "title": "Writing",
          "slug": "writing",
          "feature": [
            {
              "title": "Writing an Articles",
              "desc": "General well-written articles on any topic you want.",
              "icon": Icons.book,
              "bgColor": LightTheme.green,
              "route": VirtualGuide.writingAnArticles,
              "prompt":
                  "Write an full professional SEO friendly article with heading about [Your Topic]",
              "model": "text-davinci-003",
              "max_tokens": 1000
            },
            {
              "title": "Academic Writer",
              "desc":
                  "Generate educational writing such as essays, reports, etc.",
              "icon": Icons.cast_for_education,
              "bgColor": LightTheme.blue,
              "route": VirtualGuide.academicWriter,
              "prompt":
                  "Write an full professional SEO friendly academic article with heading about [Your Topic]",
              "model": "text-davinci-003",
              "max_tokens": 1000
            },
            {
              "title": "Summarize",
              "desc": "Extract key points from long texts.",
              "icon": Icons.pages,
              "bgColor": LightTheme.brown,
              "route": "summarize",
              "prompt":
                  "Please summarize the key points and main ideas related to [Your Topic]",
              "model": "text-davinci-003",
              "max_tokens": 500
            },
            {
              "title": "Grammar correction",
              "desc": "Correct this to standard English",
              "icon": Icons.language,
              "bgColor": LightTheme.yellow,
              "route": "grammarCorrection",
              "prompt": "Correct this to standard English:\n\n [Your Topic]",
              "model": "text-davinci-003",
              "max_tokens": 2000
            }
          ]
        },
        {
          "title": "Creative",
          "slug": "creative",
          "feature": [
            {
              "title": "Song/Lyrics",
              "desc": "Generate lyrics from any music genre you want.",
              "icon": Icons.music_note,
              "bgColor": LightTheme.red,
              "route": "songAndLyrics",
              "prompt": "Please write a song or lyrics about [Your Topic]",
              "model": "text-davinci-003",
              "max_tokens": 500
            },
            {
              "title": "Storyteller",
              "desc": "Generate stories from any given topic",
              "icon": Icons.phone_android,
              "bgColor": LightTheme.lightGreen,
              "route": "storyteller",
              "prompt":
                  "Please generate an intriguing story set in a small coastal town, where a mysterious newcomer arrives and disrupts the peaceful lives of the locals. Explore the themes of secrets, suspense, and unexpected alliances about [Your Topic]",
              "model": "text-davinci-003",
              "max_tokens": 1000
            },
            {
              "title": "Poems",
              "desc": "Generate poems in different styles",
              "icon": Icons.catching_pokemon,
              "bgColor": LightTheme.purple,
              "route": "poems",
              "prompt":
                  "Please generate a heartfelt poem about the beauty of nature and the changing seasons about [Your Topic]",
              "model": "text-davinci-003",
              "max_tokens": 500
            },
            {
              "title": "Movie Script",
              "desc": "Generate the script for the movie",
              "icon": Icons.movie,
              "bgColor": LightTheme.darkBlue,
              "route": "movieScript",
              "prompt": "Please generate a movie script about [Your Topic]",
              "model": "text-davinci-003",
              "max_tokens": 1000
            }
          ]
        },
        {
          "title": "Business",
          "slug": "business",
          "feature": [
            {
              "title": "Email Writer",
              "desc": "Generate template for emails, letters, etc.",
              "icon": Icons.email,
              "bgColor": LightTheme.green,
              "route": "emailWriter",
              "prompt":
                  "Compose a professional email regarding [Your Topic]. The email should be concise, clear, and appropriate for a formal setting. Please generate an email that effectively communicates the purpose, demonstrates professionalism, and maintains a polite tone throughout the message. Ensure that the email includes all necessary details and prompts the recipient to take the desired action.",
              "model": "text-davinci-003",
              "max_tokens": 1000
            },
            {
              "title": "Interview questions",
              "desc": "Generate interview question",
              "icon": Icons.question_answer,
              "bgColor": LightTheme.blue,
              "route": "interviewQuestions",
              "prompt":
                  "Create a list of questions for my interview with a [Your Topic] :",
              "model": "text-davinci-003",
              "max_tokens": 1000
            },
            {
              "title": "JobPost",
              "desc": "Write ideal job descriptions for posting",
              "icon": Icons.home_repair_service_rounded,
              "bgColor": LightTheme.brown,
              "route": "jobPost",
              "prompt":
                  "Create a compelling job post for a [Your Topic] position. The job post should effectively communicate the key responsibilities, qualifications, and desired skills for the role. Please generate a post that attracts suitable candidates, highlights the benefits of the position, and provides clear instructions on how to apply. Ensure that the post is engaging, concise, and formatted appropriately for online job platforms.",
              "model": "text-davinci-003",
              "max_tokens": 500
            },
            {
              "title": "Advertisements",
              "desc":
                  "Generate promotional text for products, services, brands, etc.",
              "icon": Icons.ads_click,
              "bgColor": LightTheme.yellow,
              "route": "advertisements",
              "prompt":
                  "Create a captivating advertisement promoting [Your Topic]. The advertisement should be persuasive, engaging, and able to grab the viewer's attention. Please generate an ad that effectively highlights the key features, benefits, and unique selling points of the product or service. Ensure that the ad is visually appealing, compelling in its messaging, and suitable for various marketing platforms.",
              "model": "text-davinci-003",
              "max_tokens": 1000
            }
          ]
        },
        {
          "title": "Social Media",
          "slug": "socialMedia",
          "feature": [
            {
              "title": "Linkedin",
              "desc": "Create attention grabbing posts on Linkedin.",
              "icon": Icons.phonelink_rounded,
              "bgColor": LightTheme.water,
              "route": "linkedin",
              "prompt":
                  "Please generate a compelling LinkedIn post highlighting the importance of [Your Topic] in today's professional landscape. Incorporate relevant industry insights and share actionable tips to help professionals excel in this area. Use the professional tags to reach a wider audience of like-minded individuals.",
              "model": "text-davinci-003",
              "max_tokens": 500
            },
            {
              "title": "Instagram",
              "desc": "Write captions that attract audience on instagram.",
              "icon": Icons.phonelink_rounded,
              "bgColor": LightTheme.red,
              "route": "instagram",
              "prompt":
                  "Craft a captivating Instagram post centered around [Your Topic]. The post should be visually appealing and engaging, accompanied by a compelling caption that conveys the essence of the topic. Please generate a post that grabs attention, sparks curiosity, and encourages interaction among Instagram users.",
              "model": "text-davinci-003",
              "max_tokens": 500
            },
            {
              "title": "Twitter",
              "desc":
                  "Make tweets that catch the attention of readers on twitter.",
              "icon": Icons.phonelink_rounded,
              "bgColor": LightTheme.lightGreen,
              "route": "twitter",
              "prompt":
                  "Compose an engaging and concise tweet on the topic of [Your Topic]. The tweet should be thought-provoking, informative, or entertaining, capturing the essence of the topic within the character limit. Please generate a tweet that sparks interest, encourages retweets, and initiates conversations among Twitter users.",
              "model": "text-davinci-003",
              "max_tokens": 500
            },
            {
              "title": "Facebook",
              "desc": "Create attention grabbing posts on Facebook.",
              "icon": Icons.phonelink_rounded,
              "bgColor": LightTheme.darkBlue,
              "route": "facebook",
              "prompt":
                  "Create an engaging and informative Facebook post on the topic of [Your Topic]. The post should captivate the audience's attention, provide valuable insights or information, and encourage meaningful discussions. Please generate a post that is concise, well-structured, and perfectly suited for sharing on social media.",
              "model": "text-davinci-003",
              "max_tokens": 500
            }
          ]
        },
        {
          "title": "Developer",
          "slug": "developer",
          "feature": [
            {
              "title": "Write Code",
              "desc": "Write app & website in any programming language.",
              "icon": Icons.code,
              "bgColor": LightTheme.blue,
              "route": "writeCode",
              "prompt":
                  '''Generate Correct programming code about this topic : [Your Topic]''',
              "model": "text-davinci-003",
              "max_tokens": 3000
            },
            {
              "title": "Explain Code",
              "desc": "Explain complicated programming code snippets.",
              "icon": Icons.code_off,
              "bgColor": LightTheme.yellow,
              "route": "explainCode",
              "prompt":
                  '''[Your Topic]\n\n"""\n\nHere's what the above code is doing, explained in a concise way:\n1.''',
              "model": "text-davinci-003",
              "max_tokens": 3000
            },
          ]
        },
        {
          "title": "Personal",
          "slug": "personal",
          "feature": [
            {
              "title": "Birthday",
              "desc": "Create sincere birthday wishes for loved ones.",
              "icon": Icons.watch_later,
              "bgColor": LightTheme.green,
              "route": "birthday",
              "prompt":
                  "Generate a personalized birthday wish for [Your Topic]. Make it heartfelt, cheerful, and filled with warm wishes. Ensure that the wish reflects the joyous occasion and conveys sincere emotions. Let the birthday person know how special they are and wish them a fantastic day and a wonderful year ahead.",
              "model": "text-davinci-003",
              "max_tokens": 200
            },
            {
              "title": "Apology",
              "desc": "Make an apology for the mistakes that have been made.",
              "icon": Icons.document_scanner,
              "bgColor": LightTheme.yellow,
              "route": "apology",
              "prompt": "Create an analogy for this phrase:\n\n [Your Topic] :",
              "model": "text-davinci-003",
              "max_tokens": 500
            },
            {
              "title": "Invitation",
              "desc": "Write the perfect invitation for any event.",
              "icon": Icons.insert_invitation,
              "bgColor": LightTheme.red,
              "route": "invitation",
              "prompt":
                  "Generate an inviting and engaging invitation message for [Your Topic]. Craft a warm and friendly message that highlights the importance and excitement of the event. Ensure the invitation includes key details such as the venue, any special instructions, and a call-to-action that encourages the recipient to attend and participate.",
              "model": "text-davinci-003",
              "max_tokens": 500
            },
          ]
        },
        {
          "title": "Others",
          "slug": "others",
          "feature": [
            {
              "title": "Tell A Joke",
              "desc":
                  "Write funny jokes to tell you friends and make the laugh.",
              "icon": Icons.person,
              "bgColor": LightTheme.purple,
              "route": "tellAJoke",
              "prompt":
                  "Generate a collection of funny jokes about [Your Topic] to share with friends and make them laugh. The jokes should be light-hearted, witty, and suitable for all ages. Aim for clever punchlines, wordplay, or unexpected twists that will bring a smile to everyone's face. Create jokes that can be easily memorized and shared in social settings to spread laughter and joy.",
              "model": "text-davinci-003",
              "max_tokens": 200
            },
            {
              "title": "Food Recipes",
              "desc": "Get any cooking recipes for food dishes.",
              "icon": Icons.food_bank,
              "bgColor": LightTheme.darkBlue,
              "route": "foodRecipes",
              "prompt":
                  "Generate a delicious and easy-to-follow recipe for [Your Topic]. Include a list of ingredients with their respective quantities and clear step-by-step instructions. Make sure the recipe is well-rounded, highlighting any specific techniques or tips for achieving the best results. Consider mentioning variations or substitutions for dietary preferences or restrictions, and add any additional serving suggestions or garnishes for an extra touch of flavor.",
              "model": "text-davinci-003",
              "max_tokens": 1000
            },
            {
              "title": "Diet Plan",
              "desc": "Create meal plans and diets based on your preferences.",
              "icon": Icons.next_plan,
              "bgColor": LightTheme.green,
              "route": "dietPlan",
              "prompt":
                  "Create a personalized diet plan for [Your Topic]. The plan should include well-balanced meals and snacks that provide essential nutrients while aligning with the individual's specific goals or dietary needs. Consider including a variety of food groups, portion sizes, and suggested meal timings. Provide options for breakfast, lunch, dinner, and snacks, and ensure the plan is flexible and adaptable to individual preferences and restrictions. Aim for a healthy and sustainable approach that promotes overall well-being.",
              "model": "text-davinci-003",
              "max_tokens": 1000
            },
          ]
        },
      ]
    },
    {
      "title": "Writing",
      "slug": "writing",
      "feature": [
        {
          "title": "Writing an Articles",
          "desc": "General well-written articles on any topic you want.",
          "icon": Icons.book,
          "bgColor": LightTheme.green,
          "route": VirtualGuide.writingAnArticles,
          "prompt":
              "Write an full professional SEO friendly article with heading about [Your Topic]",
          "model": "text-davinci-003",
          "max_tokens": 1000
        },
        {
          "title": "Academic Writer",
          "desc": "Generate educational writing such as essays, reports, etc.",
          "icon": Icons.cast_for_education,
          "bgColor": LightTheme.blue,
          "route": VirtualGuide.academicWriter,
          "prompt":
              "Write an full professional SEO friendly academic article with heading about [Your Topic]",
          "model": "text-davinci-003",
          "max_tokens": 1000
        },
        {
          "title": "Summarize",
          "desc": "Extract key points from long texts.",
          "icon": Icons.pages,
          "bgColor": LightTheme.brown,
          "route": "summarize",
          "prompt":
              "Please summarize the key points and main ideas related to [Your Topic]",
          "model": "text-davinci-003",
          "max_tokens": 500
        },
        {
          "title": "Grammar correction",
          "desc": "Correct this to standard English",
          "icon": Icons.language,
          "bgColor": LightTheme.yellow,
          "route": "grammarCorrection",
          "prompt": "Correct this to standard English:\n\n [Your Topic]",
          "model": "text-davinci-003",
          "max_tokens": 2000
        }
      ]
    },
    {
      "title": "Creative",
      "slug": "creative",
      "feature": [
        {
          "title": "Song/Lyrics",
          "desc": "Generate lyrics from any music genre you want.",
          "icon": Icons.music_note,
          "bgColor": LightTheme.red,
          "route": "songAndLyrics",
          "prompt": "Please write a song or lyrics about [Your Topic]",
          "model": "text-davinci-003",
          "max_tokens": 500
        },
        {
          "title": "Storyteller",
          "desc": "Generate stories from any given topic",
          "icon": Icons.phone_android,
          "bgColor": LightTheme.lightGreen,
          "route": "storyteller",
          "prompt":
              "Please generate an intriguing story set in a small coastal town, where a mysterious newcomer arrives and disrupts the peaceful lives of the locals. Explore the themes of secrets, suspense, and unexpected alliances about [Your Topic]",
          "model": "text-davinci-003",
          "max_tokens": 1000
        },
        {
          "title": "Poems",
          "desc": "Generate poems in different styles",
          "icon": Icons.catching_pokemon,
          "bgColor": LightTheme.purple,
          "route": "poems",
          "prompt":
              "Please generate a heartfelt poem about the beauty of nature and the changing seasons about [Your Topic]",
          "model": "text-davinci-003",
          "max_tokens": 500
        },
        {
          "title": "Movie Script",
          "desc": "Generate the script for the movie",
          "icon": Icons.movie,
          "bgColor": LightTheme.darkBlue,
          "route": "movieScript",
          "prompt": "Please generate a movie script about [Your Topic]",
          "model": "text-davinci-003",
          "max_tokens": 1000
        }
      ]
    },
    {
      "title": "Business",
      "slug": "business",
      "feature": [
        {
          "title": "Email Writer",
          "desc": "Generate template for emails, letters, etc.",
          "icon": Icons.email,
          "bgColor": LightTheme.green,
          "route": "emailWriter",
          "prompt":
              "Compose a professional email regarding [Your Topic]. The email should be concise, clear, and appropriate for a formal setting. Please generate an email that effectively communicates the purpose, demonstrates professionalism, and maintains a polite tone throughout the message. Ensure that the email includes all necessary details and prompts the recipient to take the desired action.",
          "model": "text-davinci-003",
          "max_tokens": 1000
        },
        {
          "title": "Interview questions",
          "desc": "Generate interview question",
          "icon": Icons.question_answer,
          "bgColor": LightTheme.blue,
          "route": "interviewQuestions",
          "prompt":
              "Create a list of questions for my interview with a [Your Topic] :",
          "model": "text-davinci-003",
          "max_tokens": 1000
        },
        {
          "title": "JobPost",
          "desc": "Write ideal job descriptions for posting",
          "icon": Icons.home_repair_service_rounded,
          "bgColor": LightTheme.brown,
          "route": "jobPost",
          "prompt":
              "Create a compelling job post for a [Your Topic] position. The job post should effectively communicate the key responsibilities, qualifications, and desired skills for the role. Please generate a post that attracts suitable candidates, highlights the benefits of the position, and provides clear instructions on how to apply. Ensure that the post is engaging, concise, and formatted appropriately for online job platforms.",
          "model": "text-davinci-003",
          "max_tokens": 500
        },
        {
          "title": "Advertisements",
          "desc":
              "Generate promotional text for products, services, brands, etc.",
          "icon": Icons.ads_click,
          "bgColor": LightTheme.yellow,
          "route": "advertisements",
          "prompt":
              "Create a captivating advertisement promoting [Your Topic]. The advertisement should be persuasive, engaging, and able to grab the viewer's attention. Please generate an ad that effectively highlights the key features, benefits, and unique selling points of the product or service. Ensure that the ad is visually appealing, compelling in its messaging, and suitable for various marketing platforms.",
          "model": "text-davinci-003",
          "max_tokens": 1000
        }
      ]
    },
    {
      "title": "Social Media",
      "slug": "socialMedia",
      "feature": [
        {
          "title": "Linkedin",
          "desc": "Create attention grabbing posts on Linkedin.",
          "icon": Icons.phonelink_rounded,
          "bgColor": LightTheme.water,
          "route": "linkedin",
          "prompt":
              "Please generate a compelling LinkedIn post highlighting the importance of [Your Topic] in today's professional landscape. Incorporate relevant industry insights and share actionable tips to help professionals excel in this area. Use the professional tags to reach a wider audience of like-minded individuals.",
          "model": "text-davinci-003",
          "max_tokens": 500
        },
        {
          "title": "Instagram",
          "desc": "Write captions that attract audience on instagram.",
          "icon": Icons.phonelink_rounded,
          "bgColor": LightTheme.red,
          "route": "instagram",
          "prompt":
              "Craft a captivating Instagram post centered around [Your Topic]. The post should be visually appealing and engaging, accompanied by a compelling caption that conveys the essence of the topic. Please generate a post that grabs attention, sparks curiosity, and encourages interaction among Instagram users.",
          "model": "text-davinci-003",
          "max_tokens": 500
        },
        {
          "title": "Twitter",
          "desc": "Make tweets that catch the attention of readers on twitter.",
          "icon": Icons.phonelink_rounded,
          "bgColor": LightTheme.lightGreen,
          "route": "twitter",
          "prompt":
              "Compose an engaging and concise tweet on the topic of [Your Topic]. The tweet should be thought-provoking, informative, or entertaining, capturing the essence of the topic within the character limit. Please generate a tweet that sparks interest, encourages retweets, and initiates conversations among Twitter users.",
          "model": "text-davinci-003",
          "max_tokens": 500
        },
        {
          "title": "Facebook",
          "desc": "Create attention grabbing posts on Facebook.",
          "icon": Icons.phonelink_rounded,
          "bgColor": LightTheme.darkBlue,
          "route": "facebook",
          "prompt":
              "Create an engaging and informative Facebook post on the topic of [Your Topic]. The post should captivate the audience's attention, provide valuable insights or information, and encourage meaningful discussions. Please generate a post that is concise, well-structured, and perfectly suited for sharing on social media.",
          "model": "text-davinci-003",
          "max_tokens": 500
        }
      ]
    },
    {
      "title": "Developer",
      "slug": "developer",
      "feature": [
        {
          "title": "Write Code",
          "desc": "Write app & website in any programming language.",
          "icon": Icons.code,
          "bgColor": LightTheme.blue,
          "route": "writeCode",
          "prompt":
              '''Generate Correct programming code about this topic : [Your Topic]''',
          "model": "text-davinci-003",
          "max_tokens": 3000
        },
        {
          "title": "Explain Code",
          "desc": "Explain complicated programming code snippets.",
          "icon": Icons.code_off,
          "bgColor": LightTheme.yellow,
          "route": "explainCode",
          "prompt":
              '''[Your Topic]\n\n"""\n\nHere's what the above code is doing, explained in a concise way:\n1.''',
          "model": "text-davinci-003",
          "max_tokens": 3000
        },
      ]
    },
    {
      "title": "Personal",
      "slug": "personal",
      "feature": [
        {
          "title": "Birthday",
          "desc": "Create sincere birthday wishes for loved ones.",
          "icon": Icons.watch_later,
          "bgColor": LightTheme.green,
          "route": "birthday",
          "prompt":
              "Generate a personalized birthday wish for [Your Topic]. Make it heartfelt, cheerful, and filled with warm wishes. Ensure that the wish reflects the joyous occasion and conveys sincere emotions. Let the birthday person know how special they are and wish them a fantastic day and a wonderful year ahead.",
          "model": "text-davinci-003",
          "max_tokens": 200
        },
        {
          "title": "Apology",
          "desc": "Make an apology for the mistakes that have been made.",
          "icon": Icons.document_scanner,
          "bgColor": LightTheme.yellow,
          "route": "apology",
          "prompt": "Create an analogy for this phrase:\n\n [Your Topic] :",
          "model": "text-davinci-003",
          "max_tokens": 500
        },
        {
          "title": "Invitation",
          "desc": "Write the perfect invitation for any event.",
          "icon": Icons.insert_invitation,
          "bgColor": LightTheme.red,
          "route": "invitation",
          "prompt":
              "Generate an inviting and engaging invitation message for [Your Topic]. Craft a warm and friendly message that highlights the importance and excitement of the event. Ensure the invitation includes key details such as the venue, any special instructions, and a call-to-action that encourages the recipient to attend and participate.",
          "model": "text-davinci-003",
          "max_tokens": 500
        },
      ]
    },
    {
      "title": "Others",
      "slug": "others",
      "feature": [
        {
          "title": "Tell A Joke",
          "desc": "Write funny jokes to tell you friends and make the laugh.",
          "icon": Icons.person,
          "bgColor": LightTheme.purple,
          "route": "tellAJoke",
          "prompt":
              "Generate a collection of funny jokes about [Your Topic] to share with friends and make them laugh. The jokes should be light-hearted, witty, and suitable for all ages. Aim for clever punchlines, wordplay, or unexpected twists that will bring a smile to everyone's face. Create jokes that can be easily memorized and shared in social settings to spread laughter and joy.",
          "model": "text-davinci-003",
          "max_tokens": 200
        },
        {
          "title": "Food Recipes",
          "desc": "Get any cooking recipes for food dishes.",
          "icon": Icons.food_bank,
          "bgColor": LightTheme.darkBlue,
          "route": "foodRecipes",
          "prompt":
              "Generate a delicious and easy-to-follow recipe for [Your Topic]. Include a list of ingredients with their respective quantities and clear step-by-step instructions. Make sure the recipe is well-rounded, highlighting any specific techniques or tips for achieving the best results. Consider mentioning variations or substitutions for dietary preferences or restrictions, and add any additional serving suggestions or garnishes for an extra touch of flavor.",
          "model": "text-davinci-003",
          "max_tokens": 1000
        },
        {
          "title": "Diet Plan",
          "desc": "Create meal plans and diets based on your preferences.",
          "icon": Icons.next_plan,
          "bgColor": LightTheme.green,
          "route": "dietPlan",
          "prompt":
              "Create a personalized diet plan for [Your Topic]. The plan should include well-balanced meals and snacks that provide essential nutrients while aligning with the individual's specific goals or dietary needs. Consider including a variety of food groups, portion sizes, and suggested meal timings. Provide options for breakfast, lunch, dinner, and snacks, and ensure the plan is flexible and adaptable to individual preferences and restrictions. Aim for a healthy and sustainable approach that promotes overall well-being.",
          "model": "text-davinci-003",
          "max_tokens": 1000
        },
      ]
    },
  ];
}
